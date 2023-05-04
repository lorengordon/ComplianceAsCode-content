# platform = multi_platform_all
# reboot = false
# strategy = disable
# complexity = low
# disruption = low

# CAUTION: This remediation script will remove abrt-server-info-page
#	   from the system, and may remove any packages
#	   that depend on abrt-server-info-page. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

if rpm -q --quiet "abrt-server-info-page" ; then

    yum remove -y "abrt-server-info-page"

fi