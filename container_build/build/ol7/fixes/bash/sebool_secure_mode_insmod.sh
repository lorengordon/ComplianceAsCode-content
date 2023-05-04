# platform = multi_platform_ol
# reboot = false
# strategy = enable
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if ! ( [ "${container:-}" == "bwrap-osbuild" ] ) && [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

var_secure_mode_insmod='(bash-populate var_secure_mode_insmod)'

setsebool -P secure_mode_insmod $var_secure_mode_insmod

# Preload vfat in initramfs, otherwise the system fails to reboot
echo "vfat" >> /etc/modules-load.d/vfat.conf
dracut -f --regenerate-all

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi