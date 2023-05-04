# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
# reboot = true
# strategy = disable
# complexity = low
# disruption = medium
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

# Comment out any occurrences of kernel.kptr_restrict from /etc/sysctl.d/*.conf files

for f in /etc/sysctl.d/*.conf /run/sysctl.d/*.conf /usr/local/lib/sysctl.d/*.conf; do

  matching_list=$(grep -P '^(?!#).*[\s]*kernel.kptr_restrict.*$' $f | uniq )
  if ! test -z "$matching_list"; then
    while IFS= read -r entry; do
      escaped_entry=$(sed -e 's|/|\\/|g' <<< "$entry")
      # comment out "kernel.kptr_restrict" matches to preserve user data
      sed -i "s/^${escaped_entry}$/# &/g" $f
    done <<< "$matching_list"
  fi
done

#
# Set sysctl config file which to save the desired value
#

SYSCONFIG_FILE="/etc/sysctl.conf"

sysctl_kernel_kptr_restrict_value='(bash-populate sysctl_kernel_kptr_restrict_value)'


#
# Set runtime for kernel.kptr_restrict
#
/sbin/sysctl -q -n -w kernel.kptr_restrict="$sysctl_kernel_kptr_restrict_value"

#
# If kernel.kptr_restrict present in /etc/sysctl.conf, change value to appropriate value
#	else, add "kernel.kptr_restrict = value" to /etc/sysctl.conf
#

# Test if the config_file is a symbolic link. If so, use --follow-symlinks with sed.
# Otherwise, regular sed command will do.
sed_command=('sed' '-i')
if test -L "${SYSCONFIG_FILE}"; then
    sed_command+=('--follow-symlinks')
fi

# Strip any search characters in the key arg so that the key can be replaced without
# adding any search characters to the config file.
stripped_key=$(sed 's/[\^=\$,;+]*//g' <<< "^kernel.kptr_restrict")

# shellcheck disable=SC2059
printf -v formatted_output "%s = %s" "$stripped_key" "$sysctl_kernel_kptr_restrict_value"

# If the key exists, change it. Otherwise, add it to the config_file.
# We search for the key string followed by a word boundary (matched by \>),
# so if we search for 'setting', 'setting2' won't match.
if LC_ALL=C grep -q -m 1 -i -e "^kernel.kptr_restrict\\>" "${SYSCONFIG_FILE}"; then
    escaped_formatted_output=$(sed -e 's|/|\\/|g' <<< "$formatted_output")
    "${sed_command[@]}" "s/^kernel.kptr_restrict\\>.*/$escaped_formatted_output/gi" "${SYSCONFIG_FILE}"
else
    # \n is precaution for case where file ends without trailing newline
    cce="CCE-80659-6"
    printf '\n# Per %s: Set %s in %s\n' "$cce" "$formatted_output" "${SYSCONFIG_FILE}" >> "${SYSCONFIG_FILE}"
    printf '%s\n' "$formatted_output" >> "${SYSCONFIG_FILE}"
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi