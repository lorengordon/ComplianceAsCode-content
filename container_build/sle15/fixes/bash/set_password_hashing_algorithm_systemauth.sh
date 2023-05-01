# platform = multi_platform_all
# Remediation is applicable only in certain platforms
if rpm --quiet -q pam; then

if [ -e "/etc/pam.d/common-password" ] ; then
    PAM_FILE_PATH="/etc/pam.d/common-password"
    if [ -f /usr/bin/authselect ]; then
        
        if ! authselect check; then
        echo "
        authselect integrity check failed. Remediation aborted!
        This remediation could not be applied because an authselect profile was not selected or the selected profile is not intact.
        It is not recommended to manually edit the PAM files when authselect tool is available.
        In cases where the default authselect profile does not cover a specific demand, a custom authselect profile is recommended."
        exit 1
        fi

        CURRENT_PROFILE=$(authselect current -r | awk '{ print $1 }')
        # If not already in use, a custom profile is created preserving the enabled features.
        if [[ ! $CURRENT_PROFILE == custom/* ]]; then
            ENABLED_FEATURES=$(authselect current | tail -n+3 | awk '{ print $2 }')
            authselect create-profile hardening -b $CURRENT_PROFILE
            CURRENT_PROFILE="custom/hardening"
            
            authselect apply-changes -b --backup=before-hardening-custom-profile
            authselect select $CURRENT_PROFILE
            for feature in $ENABLED_FEATURES; do
                authselect enable-feature $feature;
            done
            
            authselect apply-changes -b --backup=after-hardening-custom-profile
        fi
        PAM_FILE_NAME=$(basename "/etc/pam.d/common-password")
        PAM_FILE_PATH="/etc/authselect/$CURRENT_PROFILE/$PAM_FILE_NAME"

        authselect apply-changes -b
    fi
    if ! grep -qP '^\s*password\s+'"required"'\s+pam_unix.so\s*.*' "$PAM_FILE_PATH"; then
            # Line matching group + control + module was not found. Check group + module.
            if [ "$(grep -cP '^\s*password\s+.*\s+pam_unix.so\s*' "$PAM_FILE_PATH")" -eq 1 ]; then
                # The control is updated only if one single line matches.
                sed -i -E --follow-symlinks 's/^(\s*password\s+).*(\bpam_unix.so.*)/\1'"required"' \2/' "$PAM_FILE_PATH"
            else
                echo 'password    '"required"'    pam_unix.so' >> "$PAM_FILE_PATH"
            fi
        fi
        # Check the option
        if ! grep -qP '^\s*password\s+'"required"'\s+pam_unix.so\s*.*\ssha512\b' "$PAM_FILE_PATH"; then
            sed -i -E --follow-symlinks '/\s*password\s+'"required"'\s+pam_unix.so.*/ s/$/ sha512/' "$PAM_FILE_PATH"
        fi
    if [ -f /usr/bin/authselect ]; then
        
        authselect apply-changes -b
    fi
else
    echo "/etc/pam.d/common-password was not found" >&2
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi