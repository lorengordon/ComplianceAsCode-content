# platform = multi_platform_all
# reboot = false
# strategy = disable
# complexity = low
# disruption = low

# CAUTION: This remediation script will remove nftables
#	   from the system, and may remove any packages
#	   that depend on nftables. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

if rpm -q --quiet "nftables" ; then

    yum remove -y "nftables"

fi