# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_abrt_anon_write='(bash-populate var_abrt_anon_write)'


setsebool -P abrt_anon_write $var_abrt_anon_write
