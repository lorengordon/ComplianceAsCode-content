# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_container_connect_any='(bash-populate var_container_connect_any)'


setsebool -P container_connect_any $var_container_connect_any
