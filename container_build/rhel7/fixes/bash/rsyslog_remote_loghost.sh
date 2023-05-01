# platform = Red Hat Virtualization 4,multi_platform_fedora,multi_platform_rhel,multi_platform_sle,multi_platform_ol,multi_platform_ubuntu
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

rsyslog_remote_loghost_address='(bash-populate rsyslog_remote_loghost_address)'


# Test if the config_file is a symbolic link. If so, use --follow-symlinks with sed.
# Otherwise, regular sed command will do.
sed_command=('sed' '-i')
if test -L "/etc/rsyslog.conf"; then
    sed_command+=('--follow-symlinks')
fi

# Strip any search characters in the key arg so that the key can be replaced without
# adding any search characters to the config file.
stripped_key=$(sed 's/[\^=\$,;+]*//g' <<< "^\*\.\*")

# shellcheck disable=SC2059
printf -v formatted_output "%s %s" "$stripped_key" "@@$rsyslog_remote_loghost_address"

# If the key exists, change it. Otherwise, add it to the config_file.
# We search for the key string followed by a word boundary (matched by \>),
# so if we search for 'setting', 'setting2' won't match.
if LC_ALL=C grep -q -m 1 -i -e "^\*\.\*\\>" "/etc/rsyslog.conf"; then
    escaped_formatted_output=$(sed -e 's|/|\\/|g' <<< "$formatted_output")
    "${sed_command[@]}" "s/^\*\.\*\\>.*/$escaped_formatted_output/gi" "/etc/rsyslog.conf"
else
    # \n is precaution for case where file ends without trailing newline
    cce="CCE-27343-3"
    printf '\n# Per %s: Set %s in %s\n' "$cce" "$formatted_output" "/etc/rsyslog.conf" >> "/etc/rsyslog.conf"
    printf '%s\n' "$formatted_output" >> "/etc/rsyslog.conf"
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi