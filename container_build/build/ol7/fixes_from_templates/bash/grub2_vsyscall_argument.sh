# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle




# Correct the form of default kernel command line in GRUB
if grep -q '^GRUB_CMDLINE_LINUX=.*vsyscall=.*"'  '/etc/default/grub' ; then
       # modify the GRUB command-line if an vsyscall= arg already exists
       sed -i "s/\(^GRUB_CMDLINE_LINUX=\".*\)vsyscall=[^[:space:]]\+\(.*\"\)/\1vsyscall=none\2/"  '/etc/default/grub'
else
       # no vsyscall=arg is present, append it
       sed -i "s/\(^GRUB_CMDLINE_LINUX=\".*\)\"/\1 vsyscall=none\"/"  '/etc/default/grub'
fi
grubby --update-kernel=ALL --args=vsyscall=none
