# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_nfsd_anon_write='(bash-populate var_nfsd_anon_write)'


setsebool -P nfsd_anon_write $var_nfsd_anon_write
