# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_sge_use_nfs='(bash-populate var_sge_use_nfs)'


setsebool -P sge_use_nfs $var_sge_use_nfs
