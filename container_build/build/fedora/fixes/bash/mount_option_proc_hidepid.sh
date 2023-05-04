# platform = multi_platform_all
# reboot = false
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

function perform_remediation {
    


    var_mount_option_proc_hidepid='(bash-populate var_mount_option_proc_hidepid)'

    mountoption="hidepid=$var_mount_option_proc_hidepid"
    mount_point_match_regexp="$(printf "[[:space:]]%s[[:space:]]" /proc)"

    # If the mount point is not in /etc/fstab, get previous mount options from /etc/mtab
    if ! grep "$mount_point_match_regexp" /etc/fstab; then
        # runtime opts without some automatic kernel/userspace-added defaults
        previous_mount_opts=$(grep "$mount_point_match_regexp" /etc/mtab | head -1 |  awk '{print $4}' \
                    | sed -E "s/(rw|defaults|seclabel|$mountoption)(,|$)//g;s/,$//")
        [ "$previous_mount_opts" ] && previous_mount_opts+=","
        echo "proc /proc proc defaults,${previous_mount_opts}$mountoption 0 0" >> /etc/fstab
    # If the mount_opt option is not already in the mount point's /etc/fstab entry, add it
    elif ! grep "$mount_point_match_regexp" /etc/fstab | grep "$mountoption"; then
        previous_mount_opts=$(grep "$mount_point_match_regexp" /etc/fstab | awk '{print $4}')
        sed -i "s|\(${mount_point_match_regexp}.*${previous_mount_opts}\)|\1,$mountoption|" /etc/fstab
    fi


    if mkdir -p "/proc"; then
        if mountpoint -q "/proc"; then
            mount -o remount --target "/proc"
        fi
    fi
}

perform_remediation

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi