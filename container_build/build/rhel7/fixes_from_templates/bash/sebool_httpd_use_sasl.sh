# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_httpd_use_sasl='(bash-populate var_httpd_use_sasl)'


setsebool -P httpd_use_sasl $var_httpd_use_sasl
