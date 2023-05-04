# platform = multi_platform_all
# reboot = true
# strategy = restrict
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

grubby --update-kernel=ALL --remove-args=noexec --env=/boot/grub2/grubenv

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi