# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
# reboot = true
# strategy = disable
# complexity = low
# disruption = medium
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

if LC_ALL=C grep -q -m 1 "^install uvcvideo" /etc/modprobe.d/uvcvideo.conf ; then
	
	sed -i 's#^install uvcvideo.*#install uvcvideo /bin/true#g' /etc/modprobe.d/uvcvideo.conf
else
	echo -e "\n# Disable per security requirements" >> /etc/modprobe.d/uvcvideo.conf
	echo "install uvcvideo /bin/true" >> /etc/modprobe.d/uvcvideo.conf
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi