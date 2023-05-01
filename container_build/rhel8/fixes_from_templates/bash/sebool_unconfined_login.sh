# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_unconfined_login='(bash-populate var_unconfined_login)'


setsebool -P unconfined_login $var_unconfined_login
