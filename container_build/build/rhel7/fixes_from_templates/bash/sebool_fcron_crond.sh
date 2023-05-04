# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_fcron_crond='(bash-populate var_fcron_crond)'


setsebool -P fcron_crond $var_fcron_crond
