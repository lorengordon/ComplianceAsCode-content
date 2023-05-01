# platform = multi_platform_all
# Remediation is applicable only in certain platforms
if ( [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ] && ! grep -q s390x /proc/sys/kernel/osrelease ); then

# path of file with Usbguard rules
rulesfile="/etc/usbguard/rules.conf"

echo "allow with-interface match-all { 03:*:* }" >> $rulesfile

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi