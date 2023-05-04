# platform = Red Hat Virtualization 4,multi_platform_ol,multi_platform_rhel
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ] && rpm --quiet -q audit; then

var_auditd_disk_error_action='(bash-populate var_auditd_disk_error_action)'


#
# If disk_error_action present in /etc/audit/auditd.conf, change value
# to var_auditd_disk_error_action, else
# add "disk_error_action = $var_auditd_disk_error_action" to /etc/audit/auditd.conf
#
var_auditd_disk_error_action="$(echo $var_auditd_disk_error_action | cut -d \| -f 1)"

# Test if the config_file is a symbolic link. If so, use --follow-symlinks with sed.
# Otherwise, regular sed command will do.
sed_command=('sed' '-i')
if test -L "/etc/audit/auditd.conf"; then
    sed_command+=('--follow-symlinks')
fi

# Strip any search characters in the key arg so that the key can be replaced without
# adding any search characters to the config file.
stripped_key=$(sed 's/[\^=\$,;+]*//g' <<< "^disk_error_action")

# shellcheck disable=SC2059
printf -v formatted_output "%s = %s" "$stripped_key" "$var_auditd_disk_error_action"

# If the key exists, change it. Otherwise, add it to the config_file.
# We search for the key string followed by a word boundary (matched by \>),
# so if we search for 'setting', 'setting2' won't match.
if LC_ALL=C grep -q -m 1 -i -e "^disk_error_action\\>" "/etc/audit/auditd.conf"; then
    escaped_formatted_output=$(sed -e 's|/|\\/|g' <<< "$formatted_output")
    "${sed_command[@]}" "s/^disk_error_action\\>.*/$escaped_formatted_output/gi" "/etc/audit/auditd.conf"
else
    # \n is precaution for case where file ends without trailing newline
    cce="CCE-83690-8"
    printf '\n# Per %s: Set %s in %s\n' "$cce" "$formatted_output" "/etc/audit/auditd.conf" >> "/etc/audit/auditd.conf"
    printf '%s\n' "$formatted_output" >> "/etc/audit/auditd.conf"
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi