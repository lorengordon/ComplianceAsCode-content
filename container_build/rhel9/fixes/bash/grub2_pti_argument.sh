# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
# Remediation is applicable only in certain platforms
if rpm --quiet -q grub2-common && { [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; }; then

grubby --update-kernel=ALL --args=pti=on

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi