# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_httpd_run_preupgrade='(bash-populate var_httpd_run_preupgrade)'


setsebool -P httpd_run_preupgrade $var_httpd_run_preupgrade
