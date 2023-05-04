# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
# reboot = false
# strategy = enable
# complexity = low
# disruption = low

SYSTEMCTL_EXEC='/usr/bin/systemctl'
"$SYSTEMCTL_EXEC" unmask 'systemd-journald.service'
"$SYSTEMCTL_EXEC" start 'systemd-journald.service'
"$SYSTEMCTL_EXEC" enable 'systemd-journald.service'
