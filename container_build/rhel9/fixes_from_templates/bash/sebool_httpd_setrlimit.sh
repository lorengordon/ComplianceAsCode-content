# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_httpd_setrlimit='(bash-populate var_httpd_setrlimit)'


setsebool -P httpd_setrlimit $var_httpd_setrlimit
