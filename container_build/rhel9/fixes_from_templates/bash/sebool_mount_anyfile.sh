# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_mount_anyfile='(bash-populate var_mount_anyfile)'


setsebool -P mount_anyfile $var_mount_anyfile
