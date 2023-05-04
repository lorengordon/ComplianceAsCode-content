# platform = multi_platform_all
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ] && rpm --quiet -q audit; then

AUDISP_REMOTE_CONFIG="/etc/audit/audisp-remote.conf"

option="^transport"
value="KRB5"


# Test if the config_file is a symbolic link. If so, use --follow-symlinks with sed.
# Otherwise, regular sed command will do.
sed_command=('sed' '-i')
if test -L "$AUDISP_REMOTE_CONFIG"; then
    sed_command+=('--follow-symlinks')
fi

# Strip any search characters in the key arg so that the key can be replaced without
# adding any search characters to the config file.
stripped_key=$(sed 's/[\^=\$,;+]*//g' <<< "$option")

# shellcheck disable=SC2059
printf -v formatted_output "%s = %s" "$stripped_key" "$value"

# If the key exists, change it. Otherwise, add it to the config_file.
# We search for the key string followed by a word boundary (matched by \>),
# so if we search for 'setting', 'setting2' won't match.
if LC_ALL=C grep -q -m 1 -i -e "$option\\>" "$AUDISP_REMOTE_CONFIG"; then
    escaped_formatted_output=$(sed -e 's|/|\\/|g' <<< "$formatted_output")
    "${sed_command[@]}" "s/$option\\>.*/$escaped_formatted_output/gi" "$AUDISP_REMOTE_CONFIG"
else
    # \n is precaution for case where file ends without trailing newline
    cce="CCE-80926-9"
    printf '\n# Per %s: Set %s in %s\n' "$cce" "$formatted_output" "$AUDISP_REMOTE_CONFIG" >> "$AUDISP_REMOTE_CONFIG"
    printf '%s\n' "$formatted_output" >> "$AUDISP_REMOTE_CONFIG"
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi