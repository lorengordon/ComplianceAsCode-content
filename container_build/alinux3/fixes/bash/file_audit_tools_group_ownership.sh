# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

chgrp 0 /sbin/auditctl

chgrp 0 /sbin/aureport

chgrp 0 /sbin/ausearch

chgrp 0 /sbin/autrace

chgrp 0 /sbin/auditd

chgrp 0 /sbin/rsyslogd

chgrp 0 /sbin/augenrules

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi