# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_ftpd_connect_all_unreserved='(bash-populate var_ftpd_connect_all_unreserved)'


setsebool -P ftpd_connect_all_unreserved $var_ftpd_connect_all_unreserved
