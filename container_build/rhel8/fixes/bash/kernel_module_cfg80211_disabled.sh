# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
# reboot = true
# strategy = disable
# complexity = low
# disruption = medium
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

if LC_ALL=C grep -q -m 1 "^install cfg80211" /etc/modprobe.d/cfg80211.conf ; then
	
	sed -i 's#^install cfg80211.*#install cfg80211 /bin/true#g' /etc/modprobe.d/cfg80211.conf
else
	echo -e "\n# Disable per security requirements" >> /etc/modprobe.d/cfg80211.conf
	echo "install cfg80211 /bin/true" >> /etc/modprobe.d/cfg80211.conf
fi

if ! LC_ALL=C grep -q -m 1 "^blacklist cfg80211$" /etc/modprobe.d/cfg80211.conf ; then
	echo "blacklist cfg80211" >> /etc/modprobe.d/cfg80211.conf
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi