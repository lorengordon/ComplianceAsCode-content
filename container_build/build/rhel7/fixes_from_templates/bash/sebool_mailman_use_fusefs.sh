# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_mailman_use_fusefs='(bash-populate var_mailman_use_fusefs)'


setsebool -P mailman_use_fusefs $var_mailman_use_fusefs
