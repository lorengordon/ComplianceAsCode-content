# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_use_ecryptfs_home_dirs='(bash-populate var_use_ecryptfs_home_dirs)'


setsebool -P use_ecryptfs_home_dirs $var_use_ecryptfs_home_dirs
