# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_postgresql_selinux_transmit_client_label='(bash-populate var_postgresql_selinux_transmit_client_label)'


setsebool -P postgresql_selinux_transmit_client_label $var_postgresql_selinux_transmit_client_label
