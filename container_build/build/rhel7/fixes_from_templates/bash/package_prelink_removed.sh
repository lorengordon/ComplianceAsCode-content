# platform = multi_platform_all
# reboot = false
# strategy = disable
# complexity = low
# disruption = low

# CAUTION: This remediation script will remove prelink
#	   from the system, and may remove any packages
#	   that depend on prelink. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

if rpm -q --quiet "prelink" ; then

    yum remove -y "prelink"

fi