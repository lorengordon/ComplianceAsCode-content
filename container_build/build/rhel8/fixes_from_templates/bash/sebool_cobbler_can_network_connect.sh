# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_cobbler_can_network_connect='(bash-populate var_cobbler_can_network_connect)'


setsebool -P cobbler_can_network_connect $var_cobbler_can_network_connect
