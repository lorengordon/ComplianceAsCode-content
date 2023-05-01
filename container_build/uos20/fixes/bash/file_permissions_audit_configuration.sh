# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ] && rpm --quiet -q audit; then

find -H /etc/audit/ -maxdepth 1 -perm /u+xs,g+xws,o+xwrt  -type f -regex '.*audit\(\.rules\|d\.conf\)$' -exec chmod u-xs,g-xws,o-xwrt {} \;

find -H /etc/audit/rules.d/ -maxdepth 1 -perm /u+xs,g+xws,o+xwrt  -type f -regex '.*\.rules$' -exec chmod u-xs,g-xws,o-xwrt {} \;

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi