# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_login_console_enabled='(bash-populate var_login_console_enabled)'


setsebool -P login_console_enabled $var_login_console_enabled
