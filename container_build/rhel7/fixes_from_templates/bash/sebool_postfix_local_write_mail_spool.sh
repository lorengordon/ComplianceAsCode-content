# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_postfix_local_write_mail_spool='(bash-populate var_postfix_local_write_mail_spool)'


setsebool -P postfix_local_write_mail_spool $var_postfix_local_write_mail_spool
