# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_sle
# reboot = false
# strategy = configure
# complexity = low
# disruption = medium
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

if [ -f /usr/bin/authselect ]; then
    if ! authselect check; then
echo "
authselect integrity check failed. Remediation aborted!
This remediation could not be applied because an authselect profile was not selected or the selected profile is not intact.
It is not recommended to manually edit the PAM files when authselect tool is available.
In cases where the default authselect profile does not cover a specific demand, a custom authselect profile is recommended."
exit 1
fi
authselect enable-feature without-nullok

authselect apply-changes -b
else
    
if grep -qP '^\s*auth\s+'"sufficient"'\s+pam_unix.so\s.*\bnullok\b' "/etc/pam.d/system-auth"; then
    sed -i -E --follow-symlinks 's/(.*auth.*'"sufficient"'.*pam_unix.so.*)\snullok=?[[:alnum:]]*(.*)/\1\2/g' "/etc/pam.d/system-auth"
fi
    
if grep -qP '^\s*password\s+'"sufficient"'\s+pam_unix.so\s.*\bnullok\b' "/etc/pam.d/system-auth"; then
    sed -i -E --follow-symlinks 's/(.*password.*'"sufficient"'.*pam_unix.so.*)\snullok=?[[:alnum:]]*(.*)/\1\2/g' "/etc/pam.d/system-auth"
fi
    
if grep -qP '^\s*auth\s+'"sufficient"'\s+pam_unix.so\s.*\bnullok\b' "/etc/pam.d/password-auth"; then
    sed -i -E --follow-symlinks 's/(.*auth.*'"sufficient"'.*pam_unix.so.*)\snullok=?[[:alnum:]]*(.*)/\1\2/g' "/etc/pam.d/password-auth"
fi
    
if grep -qP '^\s*password\s+'"sufficient"'\s+pam_unix.so\s.*\bnullok\b' "/etc/pam.d/password-auth"; then
    sed -i -E --follow-symlinks 's/(.*password.*'"sufficient"'.*pam_unix.so.*)\snullok=?[[:alnum:]]*(.*)/\1\2/g' "/etc/pam.d/password-auth"
fi
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi