# platform = Red Hat Virtualization 4,multi_platform_fedora,multi_platform_ol,multi_platform_rhel,multi_platform_sle,multi_platform_ubuntu
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ] && dpkg-query --show --showformat='${db:Status-Status}\n' 'auditd' 2>/dev/null | grep -q installed; then

var_auditd_max_log_file='(bash-populate var_auditd_max_log_file)'


AUDITCONFIG=/etc/audit/auditd.conf

# Test if the config_file is a symbolic link. If so, use --follow-symlinks with sed.
# Otherwise, regular sed command will do.
sed_command=('sed' '-i')
if test -L "$AUDITCONFIG"; then
    sed_command+=('--follow-symlinks')
fi

# Strip any search characters in the key arg so that the key can be replaced without
# adding any search characters to the config file.
stripped_key=$(sed 's/[\^=\$,;+]*//g' <<< "^max_log_file")

# shellcheck disable=SC2059
printf -v formatted_output "%s = %s" "$stripped_key" "$var_auditd_max_log_file"

# If the key exists, change it. Otherwise, add it to the config_file.
# We search for the key string followed by a word boundary (matched by \>),
# so if we search for 'setting', 'setting2' won't match.
if LC_ALL=C grep -q -m 1 -i -e "^max_log_file\\>" "$AUDITCONFIG"; then
    escaped_formatted_output=$(sed -e 's|/|\\/|g' <<< "$formatted_output")
    "${sed_command[@]}" "s/^max_log_file\\>.*/$escaped_formatted_output/gi" "$AUDITCONFIG"
else
    # \n is precaution for case where file ends without trailing newline
    
    printf '%s\n' "$formatted_output" >> "$AUDITCONFIG"
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi