# platform = multi_platform_all
# reboot = false
# strategy = disable
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

SOCKET_NAME="systemd-journal-remote.socket"
SYSTEMCTL_EXEC='/usr/bin/systemctl'

if "$SYSTEMCTL_EXEC" -q list-unit-files --type socket | grep -q "$SOCKET_NAME"; then
    "$SYSTEMCTL_EXEC" stop "$SOCKET_NAME"
    "$SYSTEMCTL_EXEC" unmask "$SOCKET_NAME"
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi