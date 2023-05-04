# platform = multi_platform_ol,multi_platform_rhel,multi_platform_ubuntu,multi_platform_sle
# reboot = false
# strategy = restrict
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

if ! rpm -q --quiet "aide" ; then
    yum install -y "aide"
fi










if grep -i '^.*/usr/sbin/auditctl.*$' /etc/aide.conf; then
sed -i "s#.*/usr/sbin/auditctl.*#/usr/sbin/auditctl p+i+n+u+g+s+b+acl+xattrs+sha512
#" /etc/aide.conf
else
echo "/usr/sbin/auditctl p+i+n+u+g+s+b+acl+xattrs+sha512
" >> /etc/aide.conf
fi

if grep -i '^.*/usr/sbin/auditd.*$' /etc/aide.conf; then
sed -i "s#.*/usr/sbin/auditd.*#/usr/sbin/auditd p+i+n+u+g+s+b+acl+xattrs+sha512
#" /etc/aide.conf
else
echo "/usr/sbin/auditd p+i+n+u+g+s+b+acl+xattrs+sha512
" >> /etc/aide.conf
fi

if grep -i '^.*/usr/sbin/ausearch.*$' /etc/aide.conf; then
sed -i "s#.*/usr/sbin/ausearch.*#/usr/sbin/ausearch p+i+n+u+g+s+b+acl+xattrs+sha512
#" /etc/aide.conf
else
echo "/usr/sbin/ausearch p+i+n+u+g+s+b+acl+xattrs+sha512
" >> /etc/aide.conf
fi

if grep -i '^.*/usr/sbin/aureport.*$' /etc/aide.conf; then
sed -i "s#.*/usr/sbin/aureport.*#/usr/sbin/aureport p+i+n+u+g+s+b+acl+xattrs+sha512
#" /etc/aide.conf
else
echo "/usr/sbin/aureport p+i+n+u+g+s+b+acl+xattrs+sha512
" >> /etc/aide.conf
fi

if grep -i '^.*/usr/sbin/autrace.*$' /etc/aide.conf; then
sed -i "s#.*/usr/sbin/autrace.*#/usr/sbin/autrace p+i+n+u+g+s+b+acl+xattrs+sha512
#" /etc/aide.conf
else
echo "/usr/sbin/autrace p+i+n+u+g+s+b+acl+xattrs+sha512
" >> /etc/aide.conf
fi

if grep -i '^.*/usr/sbin/augenrules.*$' /etc/aide.conf; then
sed -i "s#.*/usr/sbin/augenrules.*#/usr/sbin/augenrules p+i+n+u+g+s+b+acl+xattrs+sha512
#" /etc/aide.conf
else
echo "/usr/sbin/augenrules p+i+n+u+g+s+b+acl+xattrs+sha512
" >> /etc/aide.conf
fi

if grep -i '^.*/usr/sbin/rsyslogd.*$' /etc/aide.conf; then
sed -i "s#.*/usr/sbin/rsyslogd.*#/usr/sbin/rsyslogd p+i+n+u+g+s+b+acl+xattrs+sha512
#" /etc/aide.conf
else
echo "/usr/sbin/rsyslogd p+i+n+u+g+s+b+acl+xattrs+sha512
" >> /etc/aide.conf
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi