# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_dhcpd_use_ldap='(bash-populate var_dhcpd_use_ldap)'


setsebool -P dhcpd_use_ldap $var_dhcpd_use_ldap
