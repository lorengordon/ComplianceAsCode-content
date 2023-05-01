# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if ! ( [ "${container:-}" == "bwrap-osbuild" ] ) && [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

var_logwatch_can_network_connect_mail='(bash-populate var_logwatch_can_network_connect_mail)'


setsebool -P logwatch_can_network_connect_mail $var_logwatch_can_network_connect_mail

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi