# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_sle

if [ -f /usr/bin/authselect ]; then
    if ! authselect check; then
echo "
authselect integrity check failed. Remediation aborted!
This remediation could not be applied because an authselect profile was not selected or the selected profile is not intact.
It is not recommended to manually edit the PAM files when authselect tool is available.
In cases where the default authselect profile does not cover a specific demand, a custom authselect profile is recommended."
exit 1
fi
authselect enable-feature with-faillock

authselect apply-changes -b
else
    
AUTH_FILES=("/etc/pam.d/system-auth" "/etc/pam.d/password-auth")
for pam_file in "${AUTH_FILES[@]}"
do
    if ! grep -qE '^\s*auth\s+required\s+pam_faillock\.so\s+(preauth silent|authfail).*$' "$pam_file" ; then
        sed -i --follow-symlinks '/^auth.*sufficient.*pam_unix\.so.*/i auth        required      pam_faillock.so preauth silent' "$pam_file"
        sed -i --follow-symlinks '/^auth.*required.*pam_deny\.so.*/i auth        required      pam_faillock.so authfail' "$pam_file"
        sed -i --follow-symlinks '/^account.*required.*pam_unix\.so.*/i account     required      pam_faillock.so' "$pam_file"
    fi
    sed -Ei 's/(auth.*)(\[default=die\])(.*pam_faillock\.so)/\1required     \3/g' "$pam_file"
done

fi

AUTH_FILES=("/etc/pam.d/system-auth" "/etc/pam.d/password-auth")

FAILLOCK_CONF="/etc/security/faillock.conf"
if [ -f $FAILLOCK_CONF ]; then
    regex="^\s*audit"
    line="audit"
    if ! grep -q $regex $FAILLOCK_CONF; then
        echo $line >> $FAILLOCK_CONF
    fi
    for pam_file in "${AUTH_FILES[@]}"
    do
        if [ -e "$pam_file" ] ; then
            PAM_FILE_PATH="$pam_file"
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
                PAM_FILE_NAME=$(basename "$pam_file")
                PAM_FILE_PATH="/etc/authselect/$CURRENT_PROFILE/$PAM_FILE_NAME"

                authselect apply-changes -b
            fi
            
        if grep -qP '^\s*auth\s.*\bpam_faillock.so\s.*\baudit\b' "$PAM_FILE_PATH"; then
            sed -i -E --follow-symlinks 's/(.*auth.*pam_faillock.so.*)\baudit\b=?[[:alnum:]]*(.*)/\1\2/g' "$PAM_FILE_PATH"
        fi
            if [ -f /usr/bin/authselect ]; then
                
                authselect apply-changes -b
            fi
        else
            echo "$pam_file was not found" >&2
        fi
    done
else
    for pam_file in "${AUTH_FILES[@]}"
    do
        if ! grep -qE '^\s*auth.*pam_faillock\.so (preauth|authfail).*audit' "$pam_file"; then
            sed -i --follow-symlinks '/^auth.*required.*pam_faillock\.so.*preauth.*silent.*/ s/$/ audit/' "$pam_file"
        fi
    done
fi