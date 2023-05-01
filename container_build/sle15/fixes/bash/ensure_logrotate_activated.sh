# platform = multi_platform_all
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

LOGROTATE_CONF_FILE="/etc/logrotate.conf"

SYSTEMCTL_EXEC='/usr/bin/systemctl'


# daily rotation is configured
grep -q "^daily$" $LOGROTATE_CONF_FILE|| echo "daily" >> $LOGROTATE_CONF_FILE

# remove any line configuring weekly, monthly or yearly rotation
sed -i '/^\s*\(weekly\|monthly\|yearly\).*$/d' $LOGROTATE_CONF_FILE


# enable logrotate timer service
"$SYSTEMCTL_EXEC" start 'logrotate.timer'
"$SYSTEMCTL_EXEC" enable 'logrotate.timer'

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi