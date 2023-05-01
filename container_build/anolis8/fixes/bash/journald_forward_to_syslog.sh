# platform = multi_platform_all
# reboot = false
# strategy = restrict
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

if [ -e "/etc/systemd/journald.conf" ] ; then
    
    LC_ALL=C sed -i "/^\s*ForwardToSyslog\s*=\s*/d" "/etc/systemd/journald.conf"
else
    touch "/etc/systemd/journald.conf"
fi
# make sure file has newline at the end
sed -i -e '$a\' "/etc/systemd/journald.conf"

cp "/etc/systemd/journald.conf" "/etc/systemd/journald.conf.bak"
# Insert before the line matching the regex '^#\s*ForwardToSyslog'.
line_number="$(LC_ALL=C grep -n "^#\s*ForwardToSyslog" "/etc/systemd/journald.conf.bak" | LC_ALL=C sed 's/:.*//g')"
if [ -z "$line_number" ]; then
    # There was no match of '^#\s*ForwardToSyslog', insert at
    # the end of the file.
    printf '%s\n' "ForwardToSyslog='yes'" >> "/etc/systemd/journald.conf"
else
    head -n "$(( line_number - 1 ))" "/etc/systemd/journald.conf.bak" > "/etc/systemd/journald.conf"
    printf '%s\n' "ForwardToSyslog='yes'" >> "/etc/systemd/journald.conf"
    tail -n "+$(( line_number ))" "/etc/systemd/journald.conf.bak" >> "/etc/systemd/journald.conf"
fi
# Clean up after ourselves.
rm "/etc/systemd/journald.conf.bak"

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi