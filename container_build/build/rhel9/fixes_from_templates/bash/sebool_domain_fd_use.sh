# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_domain_fd_use='(bash-populate var_domain_fd_use)'


setsebool -P domain_fd_use $var_domain_fd_use
