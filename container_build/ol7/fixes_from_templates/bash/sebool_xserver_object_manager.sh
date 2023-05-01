# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_xserver_object_manager='(bash-populate var_xserver_object_manager)'


setsebool -P xserver_object_manager $var_xserver_object_manager
