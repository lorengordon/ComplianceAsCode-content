# platform = multi_platform_all
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

if [ -e "/etc/rsyslog.d/encrypt.conf" ] ; then
    
    LC_ALL=C sed -i "/^\s*\$ActionSendStreamDriverMode /Id" "/etc/rsyslog.d/encrypt.conf"
else
    touch "/etc/rsyslog.d/encrypt.conf"
fi
# make sure file has newline at the end
sed -i -e '$a\' "/etc/rsyslog.d/encrypt.conf"

cp "/etc/rsyslog.d/encrypt.conf" "/etc/rsyslog.d/encrypt.conf.bak"
# Insert at the end of the file
printf '%s\n' "\$ActionSendStreamDriverMode 1" >> "/etc/rsyslog.d/encrypt.conf"
# Clean up after ourselves.
rm "/etc/rsyslog.d/encrypt.conf.bak"

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi