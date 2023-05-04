# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

find -H /etc/ssh/ -maxdepth 1 -perm /u+xs,g+xws,o+xwt  -type f -regex '^.*\.pub$' -exec chmod u-xs,g-xws,o-xwt {} \;

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi