# platform = Oracle Linux 8,Red Hat Enterprise Linux 8,multi_platform_fedora

sshd_approved_macs='(bash-populate sshd_approved_macs)'


if [ -e "/etc/crypto-policies/back-ends/openssh.config" ] ; then
    
    LC_ALL=C sed -i "/^.*MACs\s\+/d" "/etc/crypto-policies/back-ends/openssh.config"
else
    touch "/etc/crypto-policies/back-ends/openssh.config"
fi
# make sure file has newline at the end
sed -i -e '$a\' "/etc/crypto-policies/back-ends/openssh.config"

cp "/etc/crypto-policies/back-ends/openssh.config" "/etc/crypto-policies/back-ends/openssh.config.bak"
# Insert at the end of the file
printf '%s\n' "MACs ${sshd_approved_macs}" >> "/etc/crypto-policies/back-ends/openssh.config"
# Clean up after ourselves.
rm "/etc/crypto-policies/back-ends/openssh.config.bak"