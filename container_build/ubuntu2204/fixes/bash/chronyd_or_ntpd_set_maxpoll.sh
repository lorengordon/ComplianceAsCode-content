# platform = Red Hat Virtualization 4,multi_platform_rhel,multi_platform_ol,multi_platform_sle,multi_platform_ubuntu
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ] && { ( dpkg-query --show --showformat='${db:Status-Status}\n' 'chrony' 2>/dev/null | grep -q installed || dpkg-query --show --showformat='${db:Status-Status}\n' 'ntp' 2>/dev/null | grep -q installed ); }; then

var_time_service_set_maxpoll='(bash-populate var_time_service_set_maxpoll)'




pof="/bin/pidof"


CONFIG_FILES="/etc/ntp.conf"
$pof ntpd || {
    CHRONY_NAME=/etc/chrony/chrony.conf
    CHRONY_PATH=${CHRONY_NAME%%.*}
    CONFIG_FILES=$(find ${CHRONY_PATH}.* -type f -name '*.conf')
}

# get list of ntp files

for config_file in $CONFIG_FILES; do
    # Set maxpoll values to var_time_service_set_maxpoll
    sed -i "s/^\(\(server\|pool\|peer\).*maxpoll\) [0-9][0-9]*\(.*\)$/\1 $var_time_service_set_maxpoll \3/" "$config_file"
done




for config_file in $CONFIG_FILES; do
    # Add maxpoll to server, pool or peer entries without maxpoll
    grep "^\(server\|pool\|peer\)" "$config_file" | grep -v maxpoll | while read -r line ; do
        sed -i "s/$line/& maxpoll $var_time_service_set_maxpoll/" "$config_file"
    done
done

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi