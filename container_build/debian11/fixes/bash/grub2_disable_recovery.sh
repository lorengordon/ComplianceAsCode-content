# platform = multi_platform_all
# reboot = true
# strategy = restrict
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if dpkg-query --show --showformat='${db:Status-Status}\n' 'grub2-common' 2>/dev/null | grep -q installed; then

if grep -q '^GRUB_DISABLE_RECOVERY=.*'  '/etc/default/grub' ; then
    sed -i 's/GRUB_DISABLE_RECOVERY=.*/GRUB_DISABLE_RECOVERY=true/' "/etc/default/grub"
else
    echo "GRUB_DISABLE_RECOVERY=true" >> '/etc/default/grub'
fi

grubby --update-kernel=ALL

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi