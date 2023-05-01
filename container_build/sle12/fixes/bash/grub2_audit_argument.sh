# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ] && { rpm --quiet -q grub2; }; then

# Correct the form of default kernel command line in GRUB
if grep -q '^GRUB_CMDLINE_LINUX=.*audit=.*"'  '/etc/default/grub' ; then
       # modify the GRUB command-line if an audit= arg already exists
       sed -i "s/\(^GRUB_CMDLINE_LINUX=\".*\)audit=[^[:space:]]\+\(.*\"\)/\1audit=1\2/"  '/etc/default/grub'
else
       # no audit=arg is present, append it
       sed -i "s/\(^GRUB_CMDLINE_LINUX=\".*\)\"/\1 audit=1\"/"  '/etc/default/grub'
fi
grub2-mkconfig -o /boot/grub2/grub2.cfg

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi