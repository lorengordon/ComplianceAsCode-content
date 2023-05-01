# platform = multi_platform_all
# reboot = true
# strategy = restrict
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

if [ "$(getconf LONG_BIT)" = "32" ] ; then
  #
  # Set runtime for kernel.exec-shield
  #
  sysctl -q -n -w kernel.exec-shield=1

  #
  # If kernel.exec-shield present in /etc/sysctl.conf, change value to "1"
  #	else, add "kernel.exec-shield = 1" to /etc/sysctl.conf
  #
  # Test if the config_file is a symbolic link. If so, use --follow-symlinks with sed.
# Otherwise, regular sed command will do.
sed_command=('sed' '-i')
if test -L "/etc/sysctl.conf"; then
    sed_command+=('--follow-symlinks')
fi

# Strip any search characters in the key arg so that the key can be replaced without
# adding any search characters to the config file.
stripped_key=$(sed 's/[\^=\$,;+]*//g' <<< "^kernel.exec-shield")

# shellcheck disable=SC2059
printf -v formatted_output "%s = %s" "$stripped_key" "1"

# If the key exists, change it. Otherwise, add it to the config_file.
# We search for the key string followed by a word boundary (matched by \>),
# so if we search for 'setting', 'setting2' won't match.
if LC_ALL=C grep -q -m 1 -i -e "^kernel.exec-shield\\>" "/etc/sysctl.conf"; then
    escaped_formatted_output=$(sed -e 's|/|\\/|g' <<< "$formatted_output")
    "${sed_command[@]}" "s/^kernel.exec-shield\\>.*/$escaped_formatted_output/gi" "/etc/sysctl.conf"
else
    # \n is precaution for case where file ends without trailing newline
    
    printf '%s\n' "$formatted_output" >> "/etc/sysctl.conf"
fi
fi

if [ "$(getconf LONG_BIT)" = "64" ] ; then
    
grubby --update-kernel=ALL --remove-args=noexec

fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi