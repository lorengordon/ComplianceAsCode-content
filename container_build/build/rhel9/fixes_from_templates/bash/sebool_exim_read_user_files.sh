# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_exim_read_user_files='(bash-populate var_exim_read_user_files)'


setsebool -P exim_read_user_files $var_exim_read_user_files
