# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
# reboot = true
# strategy = disable
# complexity = low
# disruption = medium
if LC_ALL=C grep -q -m 1 "^install mac80211" /etc/modprobe.d/mac80211.conf ; then
	
	sed -i 's#^install mac80211.*#install mac80211 /bin/true#g' /etc/modprobe.d/mac80211.conf
else
	echo -e "\n# Disable per security requirements" >> /etc/modprobe.d/mac80211.conf
	echo "install mac80211 /bin/true" >> /etc/modprobe.d/mac80211.conf
fi

if ! LC_ALL=C grep -q -m 1 "^blacklist mac80211$" /etc/modprobe.d/mac80211.conf ; then
	echo "blacklist mac80211" >> /etc/modprobe.d/mac80211.conf
fi
