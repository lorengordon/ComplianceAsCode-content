# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_fips_mode='(bash-populate var_fips_mode)'


setsebool -P fips_mode $var_fips_mode
