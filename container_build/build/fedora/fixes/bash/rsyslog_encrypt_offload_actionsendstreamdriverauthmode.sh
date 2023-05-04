# platform = Red Hat Virtualization 4,multi_platform_fedora,multi_platform_ol,multi_platform_rhel
# reboot = false
# strategy = configure
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

sed -i '/^.*\$ActionSendStreamDriverAuthMode.*/d' /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2> /dev/null

if [ -e "/etc/rsyslog.d/stream_driver_auth.conf" ] ; then
    
    LC_ALL=C sed -i "/^\s*\$ActionSendStreamDriverAuthMode /Id" "/etc/rsyslog.d/stream_driver_auth.conf"
else
    touch "/etc/rsyslog.d/stream_driver_auth.conf"
fi
# make sure file has newline at the end
sed -i -e '$a\' "/etc/rsyslog.d/stream_driver_auth.conf"

cp "/etc/rsyslog.d/stream_driver_auth.conf" "/etc/rsyslog.d/stream_driver_auth.conf.bak"
# Insert at the end of the file
printf '%s\n' "\$ActionSendStreamDriverAuthMode x509/name" >> "/etc/rsyslog.d/stream_driver_auth.conf"
# Clean up after ourselves.
rm "/etc/rsyslog.d/stream_driver_auth.conf.bak"

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi