# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_puppetmaster_use_db='(bash-populate var_puppetmaster_use_db)'


setsebool -P puppetmaster_use_db $var_puppetmaster_use_db
