# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
var_spec_store_bypass_disable_options='(bash-populate var_spec_store_bypass_disable_options)'




# Correct the form of default kernel command line in GRUB
if grep -q '^GRUB_CMDLINE_LINUX=.*spec_store_bypass_disable=.*"'  '/etc/default/grub' ; then
       # modify the GRUB command-line if an spec_store_bypass_disable= arg already exists
       sed -i "s/\(^GRUB_CMDLINE_LINUX=\".*\)spec_store_bypass_disable=[^[:space:]]\+\(.*\"\)/\1spec_store_bypass_disable=$var_spec_store_bypass_disable_options\2/"  '/etc/default/grub'
else
       # no spec_store_bypass_disable=arg is present, append it
       sed -i "s/\(^GRUB_CMDLINE_LINUX=\".*\)\"/\1 spec_store_bypass_disable=$var_spec_store_bypass_disable_options\"/"  '/etc/default/grub'
fi
grub2-mkconfig -o /boot/grub2/grub2.cfg
