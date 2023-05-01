# platform = multi_platform_all
# Remediation is applicable only in certain platforms
if ( [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ] && ! grep -q s390x /proc/sys/kernel/osrelease ); then

echo "allow with-interface match-all { 09:00:* }" >> /etc/usbguard/rules.conf

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi