# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_sanlock_use_samba='(bash-populate var_sanlock_use_samba)'


setsebool -P sanlock_use_samba $var_sanlock_use_samba
