# platform = multi_platform_all
# reboot = false
# strategy = restrict
# complexity = low
# disruption = low


    if [ -e "/etc/chrony/chrony.conf" ] ; then
    
    LC_ALL=C sed -i "/^\s*makestep 1 \-1/Id" "/etc/chrony/chrony.conf"
else
    touch "/etc/chrony/chrony.conf"
fi
# make sure file has newline at the end
sed -i -e '$a\' "/etc/chrony/chrony.conf"

cp "/etc/chrony/chrony.conf" "/etc/chrony/chrony.conf.bak"
# Insert at the end of the file
printf '%s\n' "makestep 1 -1" >> "/etc/chrony/chrony.conf"
# Clean up after ourselves.
rm "/etc/chrony/chrony.conf.bak"