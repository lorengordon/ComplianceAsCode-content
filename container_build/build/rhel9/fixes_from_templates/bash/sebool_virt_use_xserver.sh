# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_virt_use_xserver='(bash-populate var_virt_use_xserver)'


setsebool -P virt_use_xserver $var_virt_use_xserver
