# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_zabbix_can_network='(bash-populate var_zabbix_can_network)'


setsebool -P zabbix_can_network $var_zabbix_can_network
