# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_swift_can_network='(bash-populate var_swift_can_network)'


setsebool -P swift_can_network $var_swift_can_network
