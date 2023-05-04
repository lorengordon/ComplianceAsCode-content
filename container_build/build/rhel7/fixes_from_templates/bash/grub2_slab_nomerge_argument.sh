# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle




# Correct the form of default kernel command line in GRUB
if grep -q '^GRUB_CMDLINE_LINUX=.*slab_nomerge=.*"'  '/etc/default/grub' ; then
       # modify the GRUB command-line if an slab_nomerge= arg already exists
       sed -i "s/\(^GRUB_CMDLINE_LINUX=\".*\)slab_nomerge=[^[:space:]]\+\(.*\"\)/\1slab_nomerge=yes\2/"  '/etc/default/grub'
else
       # no slab_nomerge=arg is present, append it
       sed -i "s/\(^GRUB_CMDLINE_LINUX=\".*\)\"/\1 slab_nomerge=yes\"/"  '/etc/default/grub'
fi
grubby --update-kernel=ALL --args=slab_nomerge=yes
