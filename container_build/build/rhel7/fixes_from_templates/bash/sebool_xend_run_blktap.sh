# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_xend_run_blktap='(bash-populate var_xend_run_blktap)'


setsebool -P xend_run_blktap $var_xend_run_blktap
