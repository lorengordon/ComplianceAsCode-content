# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_ftpd_use_passive_mode='(bash-populate var_ftpd_use_passive_mode)'


setsebool -P ftpd_use_passive_mode $var_ftpd_use_passive_mode
