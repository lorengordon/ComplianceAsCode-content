# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_postgresql_selinux_unconfined_dbadm='(bash-populate var_postgresql_selinux_unconfined_dbadm)'


setsebool -P postgresql_selinux_unconfined_dbadm $var_postgresql_selinux_unconfined_dbadm
