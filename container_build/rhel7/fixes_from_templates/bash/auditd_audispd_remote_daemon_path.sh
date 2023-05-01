# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low

if [ -e "/etc/audisp/plugins.d/au-remote.conf" ] ; then
    
    LC_ALL=C sed -i "/^\s*path\s*=\s*/Id" "/etc/audisp/plugins.d/au-remote.conf"
else
    touch "/etc/audisp/plugins.d/au-remote.conf"
fi
# make sure file has newline at the end
sed -i -e '$a\' "/etc/audisp/plugins.d/au-remote.conf"

cp "/etc/audisp/plugins.d/au-remote.conf" "/etc/audisp/plugins.d/au-remote.conf.bak"
# Insert at the end of the file
printf '%s\n' "path = /sbin/audisp-remote" >> "/etc/audisp/plugins.d/au-remote.conf"
# Clean up after ourselves.
rm "/etc/audisp/plugins.d/au-remote.conf.bak"