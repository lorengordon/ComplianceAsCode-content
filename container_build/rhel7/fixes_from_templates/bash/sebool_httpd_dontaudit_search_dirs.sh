# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_httpd_dontaudit_search_dirs='(bash-populate var_httpd_dontaudit_search_dirs)'


setsebool -P httpd_dontaudit_search_dirs $var_httpd_dontaudit_search_dirs
