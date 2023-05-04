# platform = multi_platform_all
# reboot = false
# strategy = disable
# complexity = low
# disruption = low

# CAUTION: This remediation script will remove rsync
#	   from the system, and may remove any packages
#	   that depend on rsync. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

if rpm -q --quiet "rsync" ; then

    yum remove -y "rsync"

fi