# platform = multi_platform_all
# reboot = false
# strategy = disable
# complexity = medium
# disruption = low

if [[ -f /usr/sbin/prelink ]];
then
prelink -ua
fi

DEBIAN_FRONTEND=noninteractive apt-get remove -y "prelink"