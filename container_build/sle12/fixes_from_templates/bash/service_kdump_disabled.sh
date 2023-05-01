# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_sle,multi_platform_ubuntu,multi_platform_sle
# reboot = false
# strategy = disable
# complexity = low
# disruption = low


SYSTEMCTL_EXEC='/usr/bin/systemctl'
"$SYSTEMCTL_EXEC" stop 'kdump.service'
"$SYSTEMCTL_EXEC" disable 'kdump.service'
"$SYSTEMCTL_EXEC" mask 'kdump.service'
# Disable socket activation if we have a unit file for it
if "$SYSTEMCTL_EXEC" -q list-unit-files kdump.socket; then
    "$SYSTEMCTL_EXEC" stop 'kdump.socket'
    "$SYSTEMCTL_EXEC" mask 'kdump.socket'
fi
# The service may not be running because it has been started and failed,
# so let's reset the state so OVAL checks pass.
# Service should be 'inactive', not 'failed' after reboot though.
"$SYSTEMCTL_EXEC" reset-failed 'kdump.service' || true