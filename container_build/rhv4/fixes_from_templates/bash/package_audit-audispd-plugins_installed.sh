# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
# reboot = false
# strategy = enable
# complexity = low
# disruption = low

if ! rpm -q --quiet "audit-audispd-plugins" ; then
    yum install -y "audit-audispd-plugins"
fi