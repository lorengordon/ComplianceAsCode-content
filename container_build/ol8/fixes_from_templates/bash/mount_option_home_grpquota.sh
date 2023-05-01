# platform = multi_platform_all
# reboot = false



function perform_remediation (){

    mount_point_match_regexp="$(printf "[[:space:]]%s[[:space:]]" $1)"

    # If the mount point is not in /etc/fstab, get previous mount options from /etc/mtab
    if ! grep "$mount_point_match_regexp" /etc/fstab; then
        # runtime opts without some automatic kernel/userspace-added defaults
        previous_mount_opts=$(grep "$mount_point_match_regexp" /etc/mtab | head -1 |  awk '{print $4}' \
                    | sed -E "s/(rw|defaults|seclabel|grpquota)(,|$)//g;s/,$//")
        [ "$previous_mount_opts" ] && previous_mount_opts+=","
        echo " $1  defaults,${previous_mount_opts}grpquota 0 0" >> /etc/fstab
    # If the mount_opt option is not already in the mount point's /etc/fstab entry, add it
    elif ! grep "$mount_point_match_regexp" /etc/fstab | grep "grpquota"; then
        previous_mount_opts=$(grep "$mount_point_match_regexp" /etc/fstab | awk '{print $4}')
        sed -i "s|\(${mount_point_match_regexp}.*${previous_mount_opts}\)|\1,grpquota|" /etc/fstab
    fi

    if mkdir -p "$1"; then
        if mountpoint -q "$1"; then
            mount -o remount --target "$1"
        fi
    fi
}

readarray -t home_directories  < \
    <(awk -F':' '{if ($3>=1000 && $3!= 65534) print $6}' /etc/passwd )


for home_directory in "${home_directories[@]}"
do
    if [ -d $home_directory ]; then
        fstab_mount_point=$(df $home_directory | awk '/^\/dev/ {print $6}')
        if  ! grep -qP "^/$|^/lib$|^/opt$|^/usr$|^/bin$|^/sbin$|^/boot$|^/dev$|^/proc$" <<< $fstab_mount_point
        then
            perform_remediation "$fstab_mount_point"
        fi
    fi
done