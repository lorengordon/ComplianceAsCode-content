# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_selinuxuser_tcp_server='(bash-populate var_selinuxuser_tcp_server)'


setsebool -P selinuxuser_tcp_server $var_selinuxuser_tcp_server
