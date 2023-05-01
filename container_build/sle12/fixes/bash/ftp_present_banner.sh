# platform = multi_platform_sle


# Test if the config_file is a symbolic link. If so, use --follow-symlinks with sed.
# Otherwise, regular sed command will do.
sed_command=('sed' '-i')
if test -L "/etc/vsftpd.conf"; then
    sed_command+=('--follow-symlinks')
fi

# Strip any search characters in the key arg so that the key can be replaced without
# adding any search characters to the config file.
stripped_key=$(sed 's/[\^=\$,;+]*//g' <<< "^banner_file")

# shellcheck disable=SC2059
printf -v formatted_output "%s=%s" "$stripped_key" "/etc/issue"

# If the key exists, change it. Otherwise, add it to the config_file.
# We search for the key string followed by a word boundary (matched by \>),
# so if we search for 'setting', 'setting2' won't match.
if LC_ALL=C grep -q -m 1 -i -e "^banner_file\\>" "/etc/vsftpd.conf"; then
    escaped_formatted_output=$(sed -e 's|/|\\/|g' <<< "$formatted_output")
    "${sed_command[@]}" "s/^banner_file\\>.*/$escaped_formatted_output/gi" "/etc/vsftpd.conf"
else
    # \n is precaution for case where file ends without trailing newline
    cce="CCE-83059-6"
    printf '\n# Per %s: Set %s in %s\n' "$cce" "$formatted_output" "/etc/vsftpd.conf" >> "/etc/vsftpd.conf"
    printf '%s\n' "$formatted_output" >> "/etc/vsftpd.conf"
fi