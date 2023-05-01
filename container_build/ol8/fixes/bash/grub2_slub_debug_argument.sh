# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ] && { rpm --quiet -q grub2-common; }; then

var_slub_debug_options='(bash-populate var_slub_debug_options)'



grubby --update-kernel=ALL --args=slub_debug=$var_slub_debug_options --env=/boot/grub2/grubenv

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi