# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_httpd_dbus_sssd='(bash-populate var_httpd_dbus_sssd)'


setsebool -P httpd_dbus_sssd $var_httpd_dbus_sssd
