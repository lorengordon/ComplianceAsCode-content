# platform = multi_platform_all
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ] && rpm --quiet -q audit; then

if LC_ALL=C grep -m 1 -q ^log_group /etc/audit/auditd.conf; then
  GROUP=$(awk -F "=" '/log_group/ {print $2}' /etc/audit/auditd.conf | tr -d ' ')
  if ! [ "${GROUP}" == 'root' ] ; then
    chown root:${GROUP} /var/log/audit
    chown root:${GROUP} /var/log/audit/audit.log*
  else
    chown root:root /var/log/audit
    chown root:root /var/log/audit/audit.log*
  fi
else
  chown root:root /var/log/audit
  chown root:root /var/log/audit/audit.log*
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi