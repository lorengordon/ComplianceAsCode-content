# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle




# Correct the form of default kernel command line in GRUB
if grep -q '^GRUB_CMDLINE_LINUX=.*mce=.*"'  '/etc/default/grub' ; then
       # modify the GRUB command-line if an mce= arg already exists
       sed -i "s/\(^GRUB_CMDLINE_LINUX=\".*\)mce=[^[:space:]]\+\(.*\"\)/\1mce=0\2/"  '/etc/default/grub'
else
       # no mce=arg is present, append it
       sed -i "s/\(^GRUB_CMDLINE_LINUX=\".*\)\"/\1 mce=0\"/"  '/etc/default/grub'
fi
grub2-mkconfig -o /boot/grub2/grub2.cfg
