# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
# reboot = true
# strategy = disable
# complexity = low
# disruption = medium
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

if LC_ALL=C grep -q -m 1 "^install hfsplus" /etc/modprobe.d/hfsplus.conf ; then
	
	sed -i 's#^install hfsplus.*#install hfsplus /bin/true#g' /etc/modprobe.d/hfsplus.conf
else
	echo -e "\n# Disable per security requirements" >> /etc/modprobe.d/hfsplus.conf
	echo "install hfsplus /bin/true" >> /etc/modprobe.d/hfsplus.conf
fi

if ! LC_ALL=C grep -q -m 1 "^blacklist hfsplus$" /etc/modprobe.d/hfsplus.conf ; then
	echo "blacklist hfsplus" >> /etc/modprobe.d/hfsplus.conf
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi