# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,SUSE Linux Enterprise 15
# reboot = false
# strategy = enable
# complexity = low
# disruption = low


zypper install -y "policycoreutils"



var_selinuxuser_execmod='(bash-populate var_selinuxuser_execmod)'


setsebool -P selinuxuser_execmod $var_selinuxuser_execmod
