# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle


# Correct the form of default kernel command line in GRUB
if grep -q '^GRUB_CMDLINE_LINUX=.*nosmap=.*"'  '/etc/default/grub' ; then
       sed -i 's/\(^GRUB_CMDLINE_LINUX=".*\)nosmap=?[^[:space:]]*\(.*"\)/\1 \2/' '/etc/default/grub'
fi
grub2-mkconfig -o /boot/grub2/grub2.cfg
