# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
# reboot = true
# strategy = disable
# complexity = low
# disruption = medium
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

if LC_ALL=C grep -q -m 1 "^install firewire-core" /etc/modprobe.d/firewire-core.conf ; then
	
	sed -i 's#^install firewire-core.*#install firewire-core /bin/true#g' /etc/modprobe.d/firewire-core.conf
else
	echo -e "\n# Disable per security requirements" >> /etc/modprobe.d/firewire-core.conf
	echo "install firewire-core /bin/true" >> /etc/modprobe.d/firewire-core.conf
fi

if ! LC_ALL=C grep -q -m 1 "^blacklist firewire-core$" /etc/modprobe.d/firewire-core.conf ; then
	echo "blacklist firewire-core" >> /etc/modprobe.d/firewire-core.conf
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi