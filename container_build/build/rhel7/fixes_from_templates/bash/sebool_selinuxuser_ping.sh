# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_selinuxuser_ping='(bash-populate var_selinuxuser_ping)'


setsebool -P selinuxuser_ping $var_selinuxuser_ping
