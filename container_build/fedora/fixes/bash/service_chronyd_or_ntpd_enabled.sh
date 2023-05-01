# platform = Red Hat Enterprise Linux 7,Red Hat Enterprise Linux 8,Red Hat Virtualization 4,multi_platform_fedora,multi_platform_ol,multi_platform_sle
# reboot = false
# strategy = enable
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

if rpm --quiet -q "chrony" ; then
    if ! /usr/sbin/pidof ntpd ; then
        /usr/bin/systemctl enable "chronyd"
        /usr/bin/systemctl start "chronyd"
        # The service may not be running because it has been started and failed,
        # so let's reset the state so OVAL checks pass.
        # Service should be 'inactive', not 'failed' after reboot though.
        if /usr/bin/systemctl --failed | grep -q "chronyd"; then
            /usr/bin/systemctl reset-failed "chronyd"
        fi
    fi
elif rpm --quiet -q "ntp" ; then
    /usr/bin/systemctl enable "ntpd"
    /usr/bin/systemctl start "ntpd"
    # The service may not be running because it has been started and failed,
    # so let's reset the state so OVAL checks pass.
    # Service should be 'inactive', not 'failed' after reboot though.
    if /usr/bin/systemctl --failed | grep -q "ntpd"; then
        /usr/bin/systemctl reset-failed "ntpd"
    fi
else
    if ! rpm -q --quiet "chrony" ; then
        dnf install -y "chrony"
    fi
    /usr/bin/systemctl enable "chronyd"
    /usr/bin/systemctl start "chronyd"
    # The service may not be running because it has been started and failed,
    # so let's reset the state so OVAL checks pass.
    # Service should be 'inactive', not 'failed' after reboot though.
    if /usr/bin/systemctl --failed | grep -q "chronyd"; then
        /usr/bin/systemctl reset-failed "chronyd"
    fi
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi