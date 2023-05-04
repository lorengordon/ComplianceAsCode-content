# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
# reboot = false
# strategy = restrict
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if rpm --quiet -q pam; then

var_password_pam_maxrepeat='(bash-populate var_password_pam_maxrepeat)'





if [ -e "/etc/pam.d/system-auth" ] ; then
    PAM_FILE_PATH="/etc/pam.d/system-auth"
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
        PAM_FILE_NAME=$(basename "/etc/pam.d/system-auth")
        PAM_FILE_PATH="/etc/authselect/$CURRENT_PROFILE/$PAM_FILE_NAME"

        authselect apply-changes -b
    fi
    
if grep -qP '^\s*password\s.*\bpam_pwquality.so\s.*\bmaxrepeat\b' "$PAM_FILE_PATH"; then
    sed -i -E --follow-symlinks 's/(.*password.*pam_pwquality.so.*)\bmaxrepeat\b=?[[:alnum:]]*(.*)/\1\2/g' "$PAM_FILE_PATH"
fi
    if [ -f /usr/bin/authselect ]; then
        
        authselect apply-changes -b
    fi
else
    echo "/etc/pam.d/system-auth was not found" >&2
fi


# Test if the config_file is a symbolic link. If so, use --follow-symlinks with sed.
# Otherwise, regular sed command will do.
sed_command=('sed' '-i')
if test -L "/etc/security/pwquality.conf"; then
    sed_command+=('--follow-symlinks')
fi

# Strip any search characters in the key arg so that the key can be replaced without
# adding any search characters to the config file.
stripped_key=$(sed 's/[\^=\$,;+]*//g' <<< "^maxrepeat")

# shellcheck disable=SC2059
printf -v formatted_output "%s = %s" "$stripped_key" "$var_password_pam_maxrepeat"

# If the key exists, change it. Otherwise, add it to the config_file.
# We search for the key string followed by a word boundary (matched by \>),
# so if we search for 'setting', 'setting2' won't match.
if LC_ALL=C grep -q -m 1 -i -e "^maxrepeat\\>" "/etc/security/pwquality.conf"; then
    escaped_formatted_output=$(sed -e 's|/|\\/|g' <<< "$formatted_output")
    "${sed_command[@]}" "s/^maxrepeat\\>.*/$escaped_formatted_output/gi" "/etc/security/pwquality.conf"
else
    # \n is precaution for case where file ends without trailing newline
    
    printf '%s\n' "$formatted_output" >> "/etc/security/pwquality.conf"
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi