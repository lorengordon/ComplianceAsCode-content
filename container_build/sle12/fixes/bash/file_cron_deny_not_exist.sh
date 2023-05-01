# platform = multi_platform_all
# reboot = false
# strategy = disable
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

#!/bin/bash



    if [[ -f  /etc/cron.deny ]]; then
        rm /etc/cron.deny
    fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi