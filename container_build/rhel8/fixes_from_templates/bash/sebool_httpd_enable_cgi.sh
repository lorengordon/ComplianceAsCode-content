# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_httpd_enable_cgi='(bash-populate var_httpd_enable_cgi)'


setsebool -P httpd_enable_cgi $var_httpd_enable_cgi
