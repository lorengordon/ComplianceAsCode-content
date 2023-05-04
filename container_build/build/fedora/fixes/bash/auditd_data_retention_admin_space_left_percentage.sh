# platform = multi_platform_all
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ] && rpm --quiet -q audit; then

var_auditd_admin_space_left_percentage='(bash-populate var_auditd_admin_space_left_percentage)'


grep -q "^admin_space_left[[:space:]]*=.*$" /etc/audit/auditd.conf && \
  sed -i "s/^admin_space_left[[:space:]]*=.*$/admin_space_left = $var_auditd_admin_space_left_percentage%/g" /etc/audit/auditd.conf || \
  echo "admin_space_left = $var_auditd_admin_space_left_percentage%" >> /etc/audit/auditd.conf

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi