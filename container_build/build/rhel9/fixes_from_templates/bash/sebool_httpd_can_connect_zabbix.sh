# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_httpd_can_connect_zabbix='(bash-populate var_httpd_can_connect_zabbix)'


setsebool -P httpd_can_connect_zabbix $var_httpd_can_connect_zabbix
