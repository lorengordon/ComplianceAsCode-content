# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low



find /lib/  -type f ! -uid 0 -regex '^.*$' -exec chown 0 {} \;

find /lib64/  -type f ! -uid 0 -regex '^.*$' -exec chown 0 {} \;

find /usr/lib/  -type f ! -uid 0 -regex '^.*$' -exec chown 0 {} \;

find /usr/lib64/  -type f ! -uid 0 -regex '^.*$' -exec chown 0 {} \;
