# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_pcp_bind_all_unreserved_ports='(bash-populate var_pcp_bind_all_unreserved_ports)'


setsebool -P pcp_bind_all_unreserved_ports $var_pcp_bind_all_unreserved_ports
