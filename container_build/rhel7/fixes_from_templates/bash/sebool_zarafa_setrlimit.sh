# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_zarafa_setrlimit='(bash-populate var_zarafa_setrlimit)'


setsebool -P zarafa_setrlimit $var_zarafa_setrlimit
