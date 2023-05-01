# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if ! ( [ "${container:-}" == "bwrap-osbuild" ] ) && [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

var_unconfined_chrome_sandbox_transition='(bash-populate var_unconfined_chrome_sandbox_transition)'


setsebool -P unconfined_chrome_sandbox_transition $var_unconfined_chrome_sandbox_transition

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi