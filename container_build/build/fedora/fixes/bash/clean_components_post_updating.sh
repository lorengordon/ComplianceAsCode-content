# platform = multi_platform_fedora,multi_platform_ol,multi_platform_rhel,multi_platform_rhv,multi_platform_sle
# Remediation is applicable only in certain platforms
if rpm --quiet -q yum; then

if grep --silent ^clean_requirements_on_remove /etc/dnf/dnf.conf ; then
        sed -i "s/^clean_requirements_on_remove.*/clean_requirements_on_remove=1/g" /etc/dnf/dnf.conf
else
        echo -e "\n# Set clean_requirements_on_remove to 1 per security requirements" >> /etc/dnf/dnf.conf
        echo "clean_requirements_on_remove=1" >> /etc/dnf/dnf.conf
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi