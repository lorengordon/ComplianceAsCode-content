# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_polyinstantiation_enabled='(bash-populate var_polyinstantiation_enabled)'


setsebool -P polyinstantiation_enabled $var_polyinstantiation_enabled
