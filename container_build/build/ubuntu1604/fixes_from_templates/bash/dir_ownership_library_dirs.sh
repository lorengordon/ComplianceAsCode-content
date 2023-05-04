# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low



find -H /lib/  -type d -exec chown 0 {} \;

find -H /lib64/  -type d -exec chown 0 {} \;

find -H /usr/lib/  -type d -exec chown 0 {} \;

find -H /usr/lib64/  -type d -exec chown 0 {} \;
