# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
# Remediation is applicable only in certain platforms
if dpkg-query --show --showformat='${db:Status-Status}\n' 'grub2-common' 2>/dev/null | grep -q installed && { [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; }; then

var_rng_core_default_quality='(bash-populate var_rng_core_default_quality)'




# Correct the form of default kernel command line in GRUB
if grep -q '^GRUB_CMDLINE_LINUX=.*rng_core.default_quality=.*"'  '/etc/default/grub' ; then
       # modify the GRUB command-line if an rng_core.default_quality= arg already exists
       sed -i "s/\(^GRUB_CMDLINE_LINUX=\".*\)rng_core.default_quality=[^[:space:]]\+\(.*\"\)/\1rng_core.default_quality=$var_rng_core_default_quality\2/"  '/etc/default/grub'
else
       # no rng_core.default_quality=arg is present, append it
       sed -i "s/\(^GRUB_CMDLINE_LINUX=\".*\)\"/\1 rng_core.default_quality=$var_rng_core_default_quality\"/"  '/etc/default/grub'
fi
update-grub

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi