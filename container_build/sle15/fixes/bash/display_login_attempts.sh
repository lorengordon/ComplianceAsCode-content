# platform = multi_platform_sle,Red Hat Virtualization 4,multi_platform_fedora,multi_platform_ol,multi_platform_rhel,multi_platform_ubuntu
# Remediation is applicable only in certain platforms
if rpm --quiet -q pam; then

if [ -e "/etc/pam.d/login" ] ; then
    PAM_FILE_PATH="/etc/pam.d/login"
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
        PAM_FILE_NAME=$(basename "/etc/pam.d/login")
        PAM_FILE_PATH="/etc/authselect/$CURRENT_PROFILE/$PAM_FILE_NAME"

        authselect apply-changes -b
    fi
    if ! grep -qP '^\s*session\s+'"required"'\s+pam_lastlog.so\s*.*' "$PAM_FILE_PATH"; then
            # Line matching group + control + module was not found. Check group + module.
            if [ "$(grep -cP '^\s*session\s+.*\s+pam_lastlog.so\s*' "$PAM_FILE_PATH")" -eq 1 ]; then
                # The control is updated only if one single line matches.
                sed -i -E --follow-symlinks 's/^(\s*session\s+).*(\bpam_lastlog.so.*)/\1'"required"' \2/' "$PAM_FILE_PATH"
            else
                sed -i --follow-symlinks '1i session     '"required"'    pam_lastlog.so' "$PAM_FILE_PATH"
            fi
        fi
        # Check the option
        if ! grep -qP '^\s*session\s+'"required"'\s+pam_lastlog.so\s*.*\sshowfailed\b' "$PAM_FILE_PATH"; then
            sed -i -E --follow-symlinks '/\s*session\s+'"required"'\s+pam_lastlog.so.*/ s/$/ showfailed/' "$PAM_FILE_PATH"
        fi
    if [ -f /usr/bin/authselect ]; then
        
        authselect apply-changes -b
    fi
else
    echo "/etc/pam.d/login was not found" >&2
fi
if [ -e "/etc/pam.d/login" ] ; then
    PAM_FILE_PATH="/etc/pam.d/login"
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
        PAM_FILE_NAME=$(basename "/etc/pam.d/login")
        PAM_FILE_PATH="/etc/authselect/$CURRENT_PROFILE/$PAM_FILE_NAME"

        authselect apply-changes -b
    fi
    
if grep -qP '^\s*session\s.*\bpam_lastlog.so\s.*\bsilent\b' "$PAM_FILE_PATH"; then
    sed -i -E --follow-symlinks 's/(.*session.*pam_lastlog.so.*)\bsilent\b=?[[:alnum:]]*(.*)/\1\2/g' "$PAM_FILE_PATH"
fi
    if [ -f /usr/bin/authselect ]; then
        
        authselect apply-changes -b
    fi
else
    echo "/etc/pam.d/login was not found" >&2
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi