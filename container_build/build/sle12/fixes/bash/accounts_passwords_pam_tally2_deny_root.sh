# platform = multi_platform_sle,multi_platform_ubuntu
# reboot = false
# strategy = restrict
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if rpm --quiet -q pam; then

if ! grep -qP '^\s*auth\s+'"required"'\s+pam_tally2.so\s*.*' "/etc/pam.d/common-auth"; then
    # Line matching group + control + module was not found. Check group + module.
    if [ "$(grep -cP '^\s*auth\s+.*\s+pam_tally2.so\s*' "/etc/pam.d/common-auth")" -eq 1 ]; then
        # The control is updated only if one single line matches.
        sed -i -E --follow-symlinks 's/^(\s*auth\s+).*(\bpam_tally2.so.*)/\1'"required"' \2/' "/etc/pam.d/common-auth"
    else
        echo 'auth    '"required"'    pam_tally2.so' >> "/etc/pam.d/common-auth"
    fi
fi
# Check the option
if ! grep -qP '^\s*auth\s+'"required"'\s+pam_tally2.so\s*.*\seven_deny_root\b' "/etc/pam.d/common-auth"; then
    sed -i -E --follow-symlinks '/\s*auth\s+'"required"'\s+pam_tally2.so.*/ s/$/ even_deny_root/' "/etc/pam.d/common-auth"
fi

if ! grep -qP '^\s*account\s+'"required"'\s+pam_tally2.so\s*.*' "/etc/pam.d/common-account"; then
    # Line matching group + control + module was not found. Check group + module.
    if [ "$(grep -cP '^\s*account\s+.*\s+pam_tally2.so\s*' "/etc/pam.d/common-account")" -eq 1 ]; then
        # The control is updated only if one single line matches.
        sed -i -E --follow-symlinks 's/^(\s*account\s+).*(\bpam_tally2.so.*)/\1'"required"' \2/' "/etc/pam.d/common-account"
    else
        echo 'account    '"required"'    pam_tally2.so' >> "/etc/pam.d/common-account"
    fi
fi
# Check the option
if ! grep -qP '^\s*account\s+'"required"'\s+pam_tally2.so\s*.*\s\b' "/etc/pam.d/common-account"; then
    sed -i -E --follow-symlinks '/\s*account\s+'"required"'\s+pam_tally2.so.*/ s/$/ /' "/etc/pam.d/common-account"
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi