# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_samba_export_all_rw='(bash-populate var_samba_export_all_rw)'


setsebool -P samba_export_all_rw $var_samba_export_all_rw
