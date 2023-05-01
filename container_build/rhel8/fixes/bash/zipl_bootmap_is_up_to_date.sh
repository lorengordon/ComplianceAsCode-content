# platform = multi_platform_all
# Remediation is applicable only in certain platforms
if grep -q s390x /proc/sys/kernel/osrelease && { [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; }; then

/usr/sbin/zipl

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi