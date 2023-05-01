# platform = multi_platform_sle
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

if rpm -qa pam_pkcs11; then
    if grep "^\s*cert_policy" /etc/pam_pkcs11/pam_pkcs11.conf | grep -q "ca"; then
        sed -i "/^\s*#/! s/cert_policy.*/cert_policy = ca, ocsp_on, signature;/g" /etc/pam_pkcs11/pam_pkcs11.conf
    fi
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi