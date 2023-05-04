# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_mcelog_server='(bash-populate var_mcelog_server)'


setsebool -P mcelog_server $var_mcelog_server
