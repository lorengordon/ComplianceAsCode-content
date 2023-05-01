# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if ! ( [ "${container:-}" == "bwrap-osbuild" ] ) && [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

var_unconfined_login='(bash-populate var_unconfined_login)'


setsebool -P unconfined_login $var_unconfined_login

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi