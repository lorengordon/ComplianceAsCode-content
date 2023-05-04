# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if ! ( [ "${container:-}" == "bwrap-osbuild" ] ) && [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

var_httpd_ssi_exec='(bash-populate var_httpd_ssi_exec)'


setsebool -P httpd_ssi_exec $var_httpd_ssi_exec

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi