# platform = multi_platform_all
# reboot = false
# strategy = disable
# complexity = medium
# disruption = low

if [[ -f /usr/sbin/prelink ]];
then
prelink -ua
fi

if rpm -q --quiet "prelink" ; then

    yum remove -y "prelink"

fi