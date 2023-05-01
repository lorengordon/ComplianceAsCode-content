# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_mcelog_foreground='(bash-populate var_mcelog_foreground)'


setsebool -P mcelog_foreground $var_mcelog_foreground
