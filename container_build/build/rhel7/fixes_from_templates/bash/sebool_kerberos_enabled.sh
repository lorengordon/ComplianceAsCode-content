# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_kerberos_enabled='(bash-populate var_kerberos_enabled)'


setsebool -P kerberos_enabled $var_kerberos_enabled
