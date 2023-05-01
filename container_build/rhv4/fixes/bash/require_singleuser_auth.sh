# platform = multi_platform_all
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

service_file="/usr/lib/systemd/system/rescue.service"

sulogin='/bin/sh -c "/sbin/sulogin; /usr/bin/systemctl --fail --no-block default"'

if grep "^ExecStart=.*" "$service_file" ; then
    sed -i "s%^ExecStart=.*%ExecStart=-$sulogin%" "$service_file"
else
    echo "ExecStart=-$sulogin" >> "$service_file"
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi