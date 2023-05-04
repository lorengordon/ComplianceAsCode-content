# platform = multi_platform_rhel,multi_platform_ol,multi_platform_rhv,multi_platform_sle
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ] && { grep -qP "^ID=[\"']?ol[\"']?$" "/etc/os-release" && { real="$(grep -P "^VERSION_ID=[\"']?[\w.]+[\"']?$" /etc/os-release | sed "s/^VERSION_ID=[\"']\?\([^\"']\+\)[\"']\?$/\1/")"; expected="7.4"; [[ "$real" != "$expected" ]] && printf "%s\n%s" "$real" "$expected" | sort -VC; }; }; then

var_sshd_disable_compression='(bash-populate var_sshd_disable_compression)'


# Test if the config_file is a symbolic link. If so, use --follow-symlinks with sed.
# Otherwise, regular sed command will do.
sed_command=('sed' '-i')
if test -L "/etc/ssh/sshd_config"; then
    sed_command+=('--follow-symlinks')
fi

# Strip any search characters in the key arg so that the key can be replaced without
# adding any search characters to the config file.
stripped_key=$(sed 's/[\^=\$,;+]*//g' <<< "^Compression")

# shellcheck disable=SC2059
printf -v formatted_output "%s %s" "$stripped_key" "$var_sshd_disable_compression"

# If the key exists, change it. Otherwise, add it to the config_file.
# We search for the key string followed by a word boundary (matched by \>),
# so if we search for 'setting', 'setting2' won't match.
if LC_ALL=C grep -q -m 1 -i -e "^Compression\\>" "/etc/ssh/sshd_config"; then
    escaped_formatted_output=$(sed -e 's|/|\\/|g' <<< "$formatted_output")
    "${sed_command[@]}" "s/^Compression\\>.*/$escaped_formatted_output/gi" "/etc/ssh/sshd_config"
else
    # \n is precaution for case where file ends without trailing newline
    
    printf '%s\n' "$formatted_output" >> "/etc/ssh/sshd_config"
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi