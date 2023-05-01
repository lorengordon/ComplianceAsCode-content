# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

chown 0 /sbin/auditctl

chown 0 /sbin/aureport

chown 0 /sbin/ausearch

chown 0 /sbin/autrace

chown 0 /sbin/auditd

chown 0 /sbin/rsyslogd

chown 0 /sbin/augenrules

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi