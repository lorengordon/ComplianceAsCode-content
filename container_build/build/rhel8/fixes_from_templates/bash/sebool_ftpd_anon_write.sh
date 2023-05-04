# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_ftpd_anon_write='(bash-populate var_ftpd_anon_write)'


setsebool -P ftpd_anon_write $var_ftpd_anon_write
