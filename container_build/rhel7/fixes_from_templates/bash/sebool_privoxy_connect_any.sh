# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_privoxy_connect_any='(bash-populate var_privoxy_connect_any)'


setsebool -P privoxy_connect_any $var_privoxy_connect_any
