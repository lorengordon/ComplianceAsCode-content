# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_cluster_manage_all_files='(bash-populate var_cluster_manage_all_files)'


setsebool -P cluster_manage_all_files $var_cluster_manage_all_files
