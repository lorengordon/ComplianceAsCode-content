# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_mpd_use_cifs='(bash-populate var_mpd_use_cifs)'


setsebool -P mpd_use_cifs $var_mpd_use_cifs
