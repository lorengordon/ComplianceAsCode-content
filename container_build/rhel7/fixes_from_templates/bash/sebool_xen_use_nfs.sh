# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_xen_use_nfs='(bash-populate var_xen_use_nfs)'


setsebool -P xen_use_nfs $var_xen_use_nfs
