# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_daemons_use_tty='(bash-populate var_daemons_use_tty)'


setsebool -P daemons_use_tty $var_daemons_use_tty
