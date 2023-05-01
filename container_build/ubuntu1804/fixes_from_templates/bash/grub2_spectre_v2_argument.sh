# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle




# Correct the form of default kernel command line in GRUB
if grep -q '^GRUB_CMDLINE_LINUX=.*spectre_v2=.*"'  '/etc/default/grub' ; then
       # modify the GRUB command-line if an spectre_v2= arg already exists
       sed -i "s/\(^GRUB_CMDLINE_LINUX=\".*\)spectre_v2=[^[:space:]]\+\(.*\"\)/\1spectre_v2=on\2/"  '/etc/default/grub'
else
       # no spectre_v2=arg is present, append it
       sed -i "s/\(^GRUB_CMDLINE_LINUX=\".*\)\"/\1 spectre_v2=on\"/"  '/etc/default/grub'
fi
update-grub 
