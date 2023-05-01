# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
# Remediation is applicable only in certain platforms
if rpm --quiet -q grub2-common; then

grubby --update-kernel=ALL --args=ipv6.disable=1 --env=/boot/grub2/grubenv

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi