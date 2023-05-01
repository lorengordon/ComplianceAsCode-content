# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_sle
# Remediation is applicable only in certain platforms
if rpm --quiet -q pam; then

# uncomment the option if commented
  sed '/^[[:space:]]*#[[:space:]]*auth[[:space:]]\+required[[:space:]]\+pam_wheel\.so[[:space:]]\+use_uid$/s/^[[:space:]]*#//' -i /etc/pam.d/su

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi