# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_ksmtuned_use_cifs='(bash-populate var_ksmtuned_use_cifs)'


setsebool -P ksmtuned_use_cifs $var_ksmtuned_use_cifs
