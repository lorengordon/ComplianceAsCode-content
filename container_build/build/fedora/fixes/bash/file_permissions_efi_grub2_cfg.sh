# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ -d /sys/firmware/efi ] && rpm --quiet -q grub2-common && { [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; }; then

chmod u-s,g-xwrs,o-xwrt /boot/grub2/grub.cfg

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi