# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_cvs_read_shadow='(bash-populate var_cvs_read_shadow)'


setsebool -P cvs_read_shadow $var_cvs_read_shadow
