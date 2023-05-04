# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if ! ( [ "${container:-}" == "bwrap-osbuild" ] ) && [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

zypper install -y "policycoreutils"



var_secure_mode_insmod='(bash-populate var_secure_mode_insmod)'


setsebool -P secure_mode_insmod $var_secure_mode_insmod

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi