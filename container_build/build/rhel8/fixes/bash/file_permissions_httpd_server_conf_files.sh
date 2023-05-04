# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low





find -H /etc/httpd/conf/ -maxdepth 1 -perm /u+xs,g+xws,o+xwrt  -type f -regex '^.*$' -exec chmod u-xs,g-xws,o-xwrt {} \;