# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low




var_unprivuser_use_svirt='(bash-populate var_unprivuser_use_svirt)'


setsebool -P unprivuser_use_svirt $var_unprivuser_use_svirt
