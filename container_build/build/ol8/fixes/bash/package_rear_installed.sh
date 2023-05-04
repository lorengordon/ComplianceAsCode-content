# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
# reboot = false
# strategy = enable
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if ! ( ( ( grep -q aarch64 /proc/sys/kernel/osrelease && grep -qP "^ID=[\"']?ol[\"']?$" "/etc/os-release" && { real="$(grep -P "^VERSION_ID=[\"']?[\w.]+[\"']?$" /etc/os-release | sed "s/^VERSION_ID=[\"']\?\([^\"']\+\)[\"']\?$/\1/")"; expected="9.0"; printf "%s\n%s" "$expected" "$real" | sort -VC; } ) || ( grep -q aarch64 /proc/sys/kernel/osrelease && grep -qP "^ID=[\"']?rhel[\"']?$" "/etc/os-release" && { real="$(grep -P "^VERSION_ID=[\"']?[\w.]+[\"']?$" /etc/os-release | sed "s/^VERSION_ID=[\"']\?\([^\"']\+\)[\"']\?$/\1/")"; expected="9.0"; printf "%s\n%s" "$expected" "$real" | sort -VC; } ) || ( grep -qP "^ID=[\"']?rhel[\"']?$" "/etc/os-release" && { real="$(grep -P "^VERSION_ID=[\"']?[\w.]+[\"']?$" /etc/os-release | sed "s/^VERSION_ID=[\"']\?\([^\"']\+\)[\"']\?$/\1/")"; expected="8.4"; printf "%s\n%s" "$real" "$expected" | sort -VC; } && grep -q s390x /proc/sys/kernel/osrelease ) ) ); then

if ! rpm -q --quiet "rear" ; then
    yum install -y "rear"
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi