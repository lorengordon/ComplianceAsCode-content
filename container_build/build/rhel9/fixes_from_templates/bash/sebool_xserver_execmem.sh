# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_xserver_execmem='(bash-populate var_xserver_execmem)'


setsebool -P xserver_execmem $var_xserver_execmem
