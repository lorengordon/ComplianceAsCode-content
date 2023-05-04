# platform = multi_platform_all
# reboot = true
# strategy = restrict
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

# Correct the form of default kernel command line in GRUB
if grep -q '^GRUB_CMDLINE_LINUX=.*noexec=.*"'  '/etc/default/grub' ; then
       sed -i 's/\(^GRUB_CMDLINE_LINUX=".*\)noexec=?[^[:space:]]*\(.*"\)/\1 \2/' '/etc/default/grub'
fi
grubby --update-kernel=ALL --remove-args=noexec

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi