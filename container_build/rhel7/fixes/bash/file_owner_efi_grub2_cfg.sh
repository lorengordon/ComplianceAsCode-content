# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ -d /sys/firmware/efi ] && rpm --quiet -q grub2-common && { [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; }; then

chown 0 /boot/efi/EFI/redhat/grub.cfg

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi