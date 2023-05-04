# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ] && { rpm --quiet -q grub2-common; }; then

# Correct the form of default kernel command line in GRUB
if grep -q '^GRUB_CMDLINE_LINUX=.*page_poison=.*"'  '/etc/default/grub' ; then
       # modify the GRUB command-line if an page_poison= arg already exists
       sed -i "s/\(^GRUB_CMDLINE_LINUX=\".*\)page_poison=[^[:space:]]\+\(.*\"\)/\1page_poison=1\2/"  '/etc/default/grub'
else
       # no page_poison=arg is present, append it
       sed -i "s/\(^GRUB_CMDLINE_LINUX=\".*\)\"/\1 page_poison=1\"/"  '/etc/default/grub'
fi
grubby --update-kernel=ALL --args=page_poison=1

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi