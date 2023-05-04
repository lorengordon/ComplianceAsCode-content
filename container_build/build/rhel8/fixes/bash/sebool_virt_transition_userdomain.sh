# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if ! ( [ "${container:-}" == "bwrap-osbuild" ] ) && [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

var_virt_transition_userdomain='(bash-populate var_virt_transition_userdomain)'


setsebool -P virt_transition_userdomain $var_virt_transition_userdomain

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi