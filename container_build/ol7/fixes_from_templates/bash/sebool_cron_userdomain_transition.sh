# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_cron_userdomain_transition='(bash-populate var_cron_userdomain_transition)'


setsebool -P cron_userdomain_transition $var_cron_userdomain_transition
