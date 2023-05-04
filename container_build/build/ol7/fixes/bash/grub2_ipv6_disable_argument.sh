# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
# Remediation is applicable only in certain platforms
if rpm --quiet -q grub2-common; then

# Correct the form of default kernel command line in GRUB
if grep -q '^GRUB_CMDLINE_LINUX=.*ipv6.disable=.*"'  '/etc/default/grub' ; then
       # modify the GRUB command-line if an ipv6.disable= arg already exists
       sed -i "s/\(^GRUB_CMDLINE_LINUX=\".*\)ipv6.disable=[^[:space:]]\+\(.*\"\)/\1ipv6.disable=1\2/"  '/etc/default/grub'
else
       # no ipv6.disable=arg is present, append it
       sed -i "s/\(^GRUB_CMDLINE_LINUX=\".*\)\"/\1 ipv6.disable=1\"/"  '/etc/default/grub'
fi
grubby --update-kernel=ALL --args=ipv6.disable=1

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi