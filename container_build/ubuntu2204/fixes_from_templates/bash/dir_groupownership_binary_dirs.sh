# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low



find -H /bin/  -type d -exec chgrp 0 {} \;

find -H /sbin/  -type d -exec chgrp 0 {} \;

find -H /usr/bin/  -type d -exec chgrp 0 {} \;

find -H /usr/sbin/  -type d -exec chgrp 0 {} \;

find -H /usr/local/bin/  -type d -exec chgrp 0 {} \;

find -H /usr/local/sbin/  -type d -exec chgrp 0 {} \;
