# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_unconfined_chrome_sandbox_transition='(bash-populate var_unconfined_chrome_sandbox_transition)'


setsebool -P unconfined_chrome_sandbox_transition $var_unconfined_chrome_sandbox_transition
