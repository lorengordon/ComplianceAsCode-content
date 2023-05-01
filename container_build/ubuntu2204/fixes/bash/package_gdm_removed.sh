# platform = multi_platform_all
# reboot = false
# strategy = disable
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if dpkg-query --show --showformat='${db:Status-Status}\n' 'gdm3' 2>/dev/null | grep -q installed; then

# CAUTION: This remediation script will remove gdm
#	   from the system, and may remove any packages
#	   that depend on gdm. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

DEBIAN_FRONTEND=noninteractive apt-get remove -y "gdm"

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi