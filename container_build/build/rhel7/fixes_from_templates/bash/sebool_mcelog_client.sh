# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_mcelog_client='(bash-populate var_mcelog_client)'


setsebool -P mcelog_client $var_mcelog_client
