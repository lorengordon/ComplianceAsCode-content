# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_selinuxuser_execheap='(bash-populate var_selinuxuser_execheap)'


setsebool -P selinuxuser_execheap $var_selinuxuser_execheap
