# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_xdm_exec_bootloader='(bash-populate var_xdm_exec_bootloader)'


setsebool -P xdm_exec_bootloader $var_xdm_exec_bootloader
