# platform = multi_platform_all
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ] && dpkg-query --show --showformat='${db:Status-Status}\n' 'auditd' 2>/dev/null | grep -q installed; then

if LC_ALL=C grep -iw log_file /etc/audit/auditd.conf; then
    FILE=$(awk -F "=" '/^log_file/ {print $2}' /etc/audit/auditd.conf | tr -d ' ')
    chown root $FILE*
else
    chown root /var/log/audit/audit.log*
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi