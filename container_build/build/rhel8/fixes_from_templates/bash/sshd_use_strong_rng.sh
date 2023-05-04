# platform = multi_platform_all
# reboot = false
# strategy = restrict
# complexity = low
# disruption = low
if [ -e "/etc/sysconfig/sshd" ] ; then
    
    LC_ALL=C sed -i "/^\s*SSH_USE_STRONG_RNG\s*=\s*/d" "/etc/sysconfig/sshd"
else
    touch "/etc/sysconfig/sshd"
fi
# make sure file has newline at the end
sed -i -e '$a\' "/etc/sysconfig/sshd"

cp "/etc/sysconfig/sshd" "/etc/sysconfig/sshd.bak"
# Insert before the line matching the regex '^#\s*SSH_USE_STRONG_RNG'.
line_number="$(LC_ALL=C grep -n "^#\s*SSH_USE_STRONG_RNG" "/etc/sysconfig/sshd.bak" | LC_ALL=C sed 's/:.*//g')"
if [ -z "$line_number" ]; then
    # There was no match of '^#\s*SSH_USE_STRONG_RNG', insert at
    # the end of the file.
    printf '%s\n' "SSH_USE_STRONG_RNG=32" >> "/etc/sysconfig/sshd"
else
    head -n "$(( line_number - 1 ))" "/etc/sysconfig/sshd.bak" > "/etc/sysconfig/sshd"
    printf '%s\n' "SSH_USE_STRONG_RNG=32" >> "/etc/sysconfig/sshd"
    tail -n "+$(( line_number ))" "/etc/sysconfig/sshd.bak" >> "/etc/sysconfig/sshd"
fi
# Clean up after ourselves.
rm "/etc/sysconfig/sshd.bak"