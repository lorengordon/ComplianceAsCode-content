# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_secure_mode_policyload='(bash-populate var_secure_mode_policyload)'


setsebool -P secure_mode_policyload $var_secure_mode_policyload
