# platform = multi_platform_all
# reboot = true
# strategy = restrict
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

systemctl set-default multi-user.target

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi