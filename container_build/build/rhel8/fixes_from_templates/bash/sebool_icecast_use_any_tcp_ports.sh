# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_icecast_use_any_tcp_ports='(bash-populate var_icecast_use_any_tcp_ports)'


setsebool -P icecast_use_any_tcp_ports $var_icecast_use_any_tcp_ports
