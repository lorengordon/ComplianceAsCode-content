# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_named_write_master_zones='(bash-populate var_named_write_master_zones)'


setsebool -P named_write_master_zones $var_named_write_master_zones
