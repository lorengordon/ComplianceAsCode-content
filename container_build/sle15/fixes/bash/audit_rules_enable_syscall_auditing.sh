# platform = multi_platform_sle
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ] && rpm --quiet -q audit; then

if [ -f "/usr/lib/systemd/system/auditd.service" ] ; then
    IS_AUGENRULES=$(grep -E "^(ExecStartPost=|Requires=augenrules\.service)" /usr/lib/systemd/system/auditd.service)

    if [[ "$IS_AUGENRULES" == *"augenrules"* ]] ; then
        for f in /etc/audit/rules.d/*.rules ; do
            sed -E -i --follow-symlinks 's/^(\s*-a\s+task,never)/#\1/' "$f"
        done
    else
        # auditctl is used
        sed -E -i --follow-symlinks 's/^(\s*-a\s+task,never)/#\1/' /etc/audit/audit.rules
    fi

    systemctl is-active --quiet auditd.service
    if [ $? -ne 0 ] ; then
        systemctl restart auditd.service
    fi
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi