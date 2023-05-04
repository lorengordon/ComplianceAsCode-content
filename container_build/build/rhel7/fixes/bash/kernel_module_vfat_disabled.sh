# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
# reboot = true
# strategy = disable
# complexity = low
# disruption = medium
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

if LC_ALL=C grep -q -m 1 "^install vfat" /etc/modprobe.d/vfat.conf ; then
	
	sed -i 's#^install vfat.*#install vfat /bin/true#g' /etc/modprobe.d/vfat.conf
else
	echo -e "\n# Disable per security requirements" >> /etc/modprobe.d/vfat.conf
	echo "install vfat /bin/true" >> /etc/modprobe.d/vfat.conf
fi

if ! LC_ALL=C grep -q -m 1 "^blacklist vfat$" /etc/modprobe.d/vfat.conf ; then
	echo "blacklist vfat" >> /etc/modprobe.d/vfat.conf
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi