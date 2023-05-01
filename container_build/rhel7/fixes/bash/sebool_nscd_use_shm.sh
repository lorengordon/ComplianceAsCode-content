# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if ! ( [ "${container:-}" == "bwrap-osbuild" ] ) && [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

var_nscd_use_shm='(bash-populate var_nscd_use_shm)'


setsebool -P nscd_use_shm $var_nscd_use_shm

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi