# platform = multi_platform_ubuntu

DEBIAN_FRONTEND=noninteractive apt-get install -y "network-manager"

nmcli radio all off