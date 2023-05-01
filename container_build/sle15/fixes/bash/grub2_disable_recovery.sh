# platform = multi_platform_all
# reboot = true
# strategy = restrict
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if rpm --quiet -q grub2; then

if grep -q '^GRUB_DISABLE_RECOVERY=.*'  '/etc/default/grub' ; then
    sed -i 's/GRUB_DISABLE_RECOVERY=.*/GRUB_DISABLE_RECOVERY=true/' "/etc/default/grub"
else
    echo "GRUB_DISABLE_RECOVERY=true" >> '/etc/default/grub'
fi

grub2-mkconfig -o /boot/grub2/grub2.cfg

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi