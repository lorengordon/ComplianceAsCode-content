# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_nfs_export_all_ro='(bash-populate var_nfs_export_all_ro)'


setsebool -P nfs_export_all_ro $var_nfs_export_all_ro
