# platform = multi_platform_all
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ] && rpm --quiet -q audit; then

var_syslog_active="yes"

AUDISP_SYSLOGCONFIG=/etc/audisp/plugins.d/syslog.conf

# Test if the config_file is a symbolic link. If so, use --follow-symlinks with sed.
# Otherwise, regular sed command will do.
sed_command=('sed' '-i')
if test -L "$AUDISP_SYSLOGCONFIG"; then
    sed_command+=('--follow-symlinks')
fi

# Strip any search characters in the key arg so that the key can be replaced without
# adding any search characters to the config file.
stripped_key=$(sed 's/[\^=\$,;+]*//g' <<< "^active")

# shellcheck disable=SC2059
printf -v formatted_output "%s = %s" "$stripped_key" "$var_syslog_active"

# If the key exists, change it. Otherwise, add it to the config_file.
# We search for the key string followed by a word boundary (matched by \>),
# so if we search for 'setting', 'setting2' won't match.
if LC_ALL=C grep -q -m 1 -i -e "^active\\>" "$AUDISP_SYSLOGCONFIG"; then
    escaped_formatted_output=$(sed -e 's|/|\\/|g' <<< "$formatted_output")
    "${sed_command[@]}" "s/^active\\>.*/$escaped_formatted_output/gi" "$AUDISP_SYSLOGCONFIG"
else
    # \n is precaution for case where file ends without trailing newline
    cce="CCE-27341-7"
    printf '\n# Per %s: Set %s in %s\n' "$cce" "$formatted_output" "$AUDISP_SYSLOGCONFIG" >> "$AUDISP_SYSLOGCONFIG"
    printf '%s\n' "$formatted_output" >> "$AUDISP_SYSLOGCONFIG"
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi