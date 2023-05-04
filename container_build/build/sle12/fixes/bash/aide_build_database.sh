# platform = Red Hat Virtualization 4,multi_platform_fedora,multi_platform_ol,multi_platform_rhel,multi_platform_sle
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

zypper install -y "aide"

/usr/bin/aide --init
/bin/cp -p /var/lib/aide/aide.db.new /var/lib/aide/aide.db

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi