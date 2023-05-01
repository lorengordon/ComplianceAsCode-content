# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_staff_exec_content='(bash-populate var_staff_exec_content)'


setsebool -P staff_exec_content $var_staff_exec_content
