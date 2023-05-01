# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_ssh_keysign='(bash-populate var_ssh_keysign)'


setsebool -P ssh_keysign $var_ssh_keysign
