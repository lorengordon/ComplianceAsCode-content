# platform = Red Hat Enterprise Linux 7,multi_platform_fedora,multi_platform_ubuntu,multi_platform_sle
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ] && { rpm --quiet -q ntp; }; then

if [ -e "/etc/ntp.conf" ] ; then
    
    LC_ALL=C sed -i "/^\s*restrict \-4\s\+/Id" "/etc/ntp.conf"
else
    touch "/etc/ntp.conf"
fi
# make sure file has newline at the end
sed -i -e '$a\' "/etc/ntp.conf"

cp "/etc/ntp.conf" "/etc/ntp.conf.bak"
# Insert at the end of the file
printf '%s\n' "restrict -4 default kod nomodify notrap nopeer noquery" >> "/etc/ntp.conf"
# Clean up after ourselves.
rm "/etc/ntp.conf.bak"
if [ -e "/etc/ntp.conf" ] ; then
    
    LC_ALL=C sed -i "/^\s*restrict \-6\s\+/Id" "/etc/ntp.conf"
else
    touch "/etc/ntp.conf"
fi
# make sure file has newline at the end
sed -i -e '$a\' "/etc/ntp.conf"

cp "/etc/ntp.conf" "/etc/ntp.conf.bak"
# Insert at the end of the file
printf '%s\n' "restrict -6 default kod nomodify notrap nopeer noquery" >> "/etc/ntp.conf"
# Clean up after ourselves.
rm "/etc/ntp.conf.bak"

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi