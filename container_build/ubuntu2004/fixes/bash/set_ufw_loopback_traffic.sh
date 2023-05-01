# platform = multi_platform_ubuntu
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

ufw allow in on lo
ufw allow out on lo
ufw deny in from 127.0.0.0/8
ufw deny in from ::1

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi