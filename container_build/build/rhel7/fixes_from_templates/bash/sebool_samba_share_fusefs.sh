# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_samba_share_fusefs='(bash-populate var_samba_share_fusefs)'


setsebool -P samba_share_fusefs $var_samba_share_fusefs
