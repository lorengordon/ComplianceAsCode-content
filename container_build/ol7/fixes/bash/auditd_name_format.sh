# platform = multi_platform_fedora,multi_platform_rhel,multi_platform_ol
# reboot = true
# strategy = restrict
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ] && rpm --quiet -q audit; then

if [ -e "/etc/audisp/audispd.conf" ] ; then
    
    LC_ALL=C sed -i "/^\s*name_format\s*=\s*/Id" "/etc/audisp/audispd.conf"
else
    touch "/etc/audisp/audispd.conf"
fi
# make sure file has newline at the end
sed -i -e '$a\' "/etc/audisp/audispd.conf"

cp "/etc/audisp/audispd.conf" "/etc/audisp/audispd.conf.bak"
# Insert at the end of the file
printf '%s\n' "name_format = hostname" >> "/etc/audisp/audispd.conf"
# Clean up after ourselves.
rm "/etc/audisp/audispd.conf.bak"

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi