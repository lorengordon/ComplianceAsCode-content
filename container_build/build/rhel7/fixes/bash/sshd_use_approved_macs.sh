# platform = Red Hat Enterprise Linux 7,Oracle Linux 7,multi_platform_sle,multi_platform_ubuntu
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

sshd_approved_macs='(bash-populate sshd_approved_macs)'


# Test if the config_file is a symbolic link. If so, use --follow-symlinks with sed.
# Otherwise, regular sed command will do.
sed_command=('sed' '-i')
if test -L "/etc/ssh/sshd_config"; then
    sed_command+=('--follow-symlinks')
fi

# Strip any search characters in the key arg so that the key can be replaced without
# adding any search characters to the config file.
stripped_key=$(sed 's/[\^=\$,;+]*//g' <<< "^MACs")

# shellcheck disable=SC2059
printf -v formatted_output "%s %s" "$stripped_key" "$sshd_approved_macs"

# If the key exists, change it. Otherwise, add it to the config_file.
# We search for the key string followed by a word boundary (matched by \>),
# so if we search for 'setting', 'setting2' won't match.
if LC_ALL=C grep -q -m 1 -i -e "^MACs\\>" "/etc/ssh/sshd_config"; then
    escaped_formatted_output=$(sed -e 's|/|\\/|g' <<< "$formatted_output")
    "${sed_command[@]}" "s/^MACs\\>.*/$escaped_formatted_output/gi" "/etc/ssh/sshd_config"
else
    # \n is precaution for case where file ends without trailing newline
    cce="CCE-27455-5"
    printf '\n# Per %s: Set %s in %s\n' "$cce" "$formatted_output" "/etc/ssh/sshd_config" >> "/etc/ssh/sshd_config"
    printf '%s\n' "$formatted_output" >> "/etc/ssh/sshd_config"
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi