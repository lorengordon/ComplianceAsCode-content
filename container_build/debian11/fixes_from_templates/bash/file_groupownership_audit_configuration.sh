# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low



find /etc/audit/ -maxdepth 1 -type f ! -gid 0 -regex '^audit(\.rules|d\.conf)$' -exec chgrp 0 {} \;


find /etc/audit/rules.d/ -maxdepth 1 -type f ! -gid 0 -regex '^.*\.rules$' -exec chgrp 0 {} \;

