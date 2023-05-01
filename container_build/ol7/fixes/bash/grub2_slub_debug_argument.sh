# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ] && { rpm --quiet -q grub2-common; }; then

var_slub_debug_options='(bash-populate var_slub_debug_options)'




# Correct the form of default kernel command line in GRUB
if grep -q '^GRUB_CMDLINE_LINUX=.*slub_debug=.*"'  '/etc/default/grub' ; then
       # modify the GRUB command-line if an slub_debug= arg already exists
       sed -i "s/\(^GRUB_CMDLINE_LINUX=\".*\)slub_debug=[^[:space:]]\+\(.*\"\)/\1slub_debug=$var_slub_debug_options\2/"  '/etc/default/grub'
else
       # no slub_debug=arg is present, append it
       sed -i "s/\(^GRUB_CMDLINE_LINUX=\".*\)\"/\1 slub_debug=$var_slub_debug_options\"/"  '/etc/default/grub'
fi
grubby --update-kernel=ALL --args=slub_debug=$var_slub_debug_options

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi