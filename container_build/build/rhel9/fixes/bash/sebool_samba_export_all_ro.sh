# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if ! ( [ "${container:-}" == "bwrap-osbuild" ] ) && [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

var_samba_export_all_ro='(bash-populate var_samba_export_all_ro)'


setsebool -P samba_export_all_ro $var_samba_export_all_ro

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi