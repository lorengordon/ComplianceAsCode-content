# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_postgresql_can_rsync='(bash-populate var_postgresql_can_rsync)'


setsebool -P postgresql_can_rsync $var_postgresql_can_rsync
