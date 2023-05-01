# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
# Remediation is applicable only in certain platforms
if dpkg-query --show --showformat='${db:Status-Status}\n' 'grub2-common' 2>/dev/null | grep -q installed && { [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; }; then

var_l1tf_options='(bash-populate var_l1tf_options)'




# Correct the form of default kernel command line in GRUB
if grep -q '^GRUB_CMDLINE_LINUX=.*l1tf=.*"'  '/etc/default/grub' ; then
       # modify the GRUB command-line if an l1tf= arg already exists
       sed -i "s/\(^GRUB_CMDLINE_LINUX=\".*\)l1tf=[^[:space:]]\+\(.*\"\)/\1l1tf=$var_l1tf_options\2/"  '/etc/default/grub'
else
       # no l1tf=arg is present, append it
       sed -i "s/\(^GRUB_CMDLINE_LINUX=\".*\)\"/\1 l1tf=$var_l1tf_options\"/"  '/etc/default/grub'
fi
update-grub

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi