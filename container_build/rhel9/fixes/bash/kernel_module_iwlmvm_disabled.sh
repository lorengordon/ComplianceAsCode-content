# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
# reboot = true
# strategy = disable
# complexity = low
# disruption = medium
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

if LC_ALL=C grep -q -m 1 "^install iwlmvm" /etc/modprobe.d/iwlmvm.conf ; then
	
	sed -i 's#^install iwlmvm.*#install iwlmvm /bin/true#g' /etc/modprobe.d/iwlmvm.conf
else
	echo -e "\n# Disable per security requirements" >> /etc/modprobe.d/iwlmvm.conf
	echo "install iwlmvm /bin/true" >> /etc/modprobe.d/iwlmvm.conf
fi

if ! LC_ALL=C grep -q -m 1 "^blacklist iwlmvm$" /etc/modprobe.d/iwlmvm.conf ; then
	echo "blacklist iwlmvm" >> /etc/modprobe.d/iwlmvm.conf
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi