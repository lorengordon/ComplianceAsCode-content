# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_tmpreaper_use_samba='(bash-populate var_tmpreaper_use_samba)'


setsebool -P tmpreaper_use_samba $var_tmpreaper_use_samba
