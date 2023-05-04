# platform = multi_platform_all
# reboot = false
# strategy = restrict
# complexity = low
# disruption = low


mkdir -p /etc/ssh/sshd_config.d
touch /etc/ssh/sshd_config.d/00-complianceascode-hardening.conf

LC_ALL=C sed -i "/^\s*ClientAliveCountMax\s\+/Id" "/etc/ssh/sshd_config"
LC_ALL=C sed -i "/^\s*ClientAliveCountMax\s\+/Id" "/etc/ssh/sshd_config.d"/*.conf
if [ -e "/etc/ssh/sshd_config.d/00-complianceascode-hardening.conf" ] ; then
    
    LC_ALL=C sed -i "/^\s*ClientAliveCountMax\s\+/Id" "/etc/ssh/sshd_config.d/00-complianceascode-hardening.conf"
else
    touch "/etc/ssh/sshd_config.d/00-complianceascode-hardening.conf"
fi
# make sure file has newline at the end
sed -i -e '$a\' "/etc/ssh/sshd_config.d/00-complianceascode-hardening.conf"

cp "/etc/ssh/sshd_config.d/00-complianceascode-hardening.conf" "/etc/ssh/sshd_config.d/00-complianceascode-hardening.conf.bak"
# Insert before the line matching the regex '^Match'.
line_number="$(LC_ALL=C grep -n "^Match" "/etc/ssh/sshd_config.d/00-complianceascode-hardening.conf.bak" | LC_ALL=C sed 's/:.*//g')"
if [ -z "$line_number" ]; then
    # There was no match of '^Match', insert at
    # the end of the file.
    printf '%s\n' "ClientAliveCountMax 0" >> "/etc/ssh/sshd_config.d/00-complianceascode-hardening.conf"
else
    head -n "$(( line_number - 1 ))" "/etc/ssh/sshd_config.d/00-complianceascode-hardening.conf.bak" > "/etc/ssh/sshd_config.d/00-complianceascode-hardening.conf"
    printf '%s\n' "ClientAliveCountMax 0" >> "/etc/ssh/sshd_config.d/00-complianceascode-hardening.conf"
    tail -n "+$(( line_number ))" "/etc/ssh/sshd_config.d/00-complianceascode-hardening.conf.bak" >> "/etc/ssh/sshd_config.d/00-complianceascode-hardening.conf"
fi
# Clean up after ourselves.
rm "/etc/ssh/sshd_config.d/00-complianceascode-hardening.conf.bak"