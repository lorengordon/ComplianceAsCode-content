# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low





find -H /etc/ssh/ -maxdepth 1 -perm /u+xs,g+xws,o+xwt  -type f -regex '^.*\.pub$' -exec chmod u-xs,g-xws,o-xwt {} \;
