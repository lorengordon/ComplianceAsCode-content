# platform = multi_platform_all

if ! rpm -q --quiet "NetworkManager" ; then
    yum install -y "NetworkManager"
fi

nmcli radio all off