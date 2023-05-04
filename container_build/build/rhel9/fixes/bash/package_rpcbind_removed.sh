# platform = multi_platform_all
# reboot = false
# strategy = disable
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

# CAUTION: This remediation script will remove rpcbind
#	   from the system, and may remove any packages
#	   that depend on rpcbind. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

if rpm -q --quiet "rpcbind" ; then

    dnf remove -y "rpcbind"

fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi