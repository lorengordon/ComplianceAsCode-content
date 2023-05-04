# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_global_ssp='(bash-populate var_global_ssp)'


setsebool -P global_ssp $var_global_ssp
