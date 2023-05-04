# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low





find -H /var/log/  -perm /u+xs,g+xws,o+xwrt ! -name '*[bw]tmp' ! -name '*lastlog' -type f -regex '.*' -exec chmod u-xs,g-xws,o-xwrt {} \;