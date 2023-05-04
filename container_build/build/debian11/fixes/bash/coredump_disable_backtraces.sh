# platform = multi_platform_all
# reboot = false
# strategy = restrict
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if dpkg-query --show --showformat='${db:Status-Status}\n' 'systemd' 2>/dev/null | grep -q installed; then

if [ -e "/etc/systemd/coredump.conf" ] ; then
    
    LC_ALL=C sed -i "/^\s*ProcessSizeMax\s*=\s*/Id" "/etc/systemd/coredump.conf"
else
    touch "/etc/systemd/coredump.conf"
fi
# make sure file has newline at the end
sed -i -e '$a\' "/etc/systemd/coredump.conf"

cp "/etc/systemd/coredump.conf" "/etc/systemd/coredump.conf.bak"
# Insert at the end of the file
printf '%s\n' "ProcessSizeMax=0" >> "/etc/systemd/coredump.conf"
# Clean up after ourselves.
rm "/etc/systemd/coredump.conf.bak"

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi