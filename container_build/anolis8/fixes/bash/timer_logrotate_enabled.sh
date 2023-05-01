# platform = multi_platform_all
# reboot = false
# strategy = enable
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

SYSTEMCTL_EXEC='/usr/bin/systemctl'
"$SYSTEMCTL_EXEC" start 'logrotate.timer'
"$SYSTEMCTL_EXEC" enable 'logrotate.timer'

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi