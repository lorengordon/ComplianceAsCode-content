# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_daemons_dump_core='(bash-populate var_daemons_dump_core)'


setsebool -P daemons_dump_core $var_daemons_dump_core
