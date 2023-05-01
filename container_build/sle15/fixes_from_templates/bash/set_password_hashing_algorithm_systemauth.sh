# platform = multi_platform_all
# reboot = false
# strategy = restrict
# complexity = low
# disruption = low

declare -a VALUES=()
declare -a VALUE_NAMES=()
declare -a ARGS=()
declare -a NEW_ARGS=()


VALUES+=("")
VALUE_NAMES+=("")
ARGS+=("sha512")
NEW_ARGS+=("sha512")

for idx in "${!VALUES[@]}"
do
    if [ -e "/etc/pam.d/common-password" ] ; then
        valueRegex="${VALUES[$idx]}" defaultValue="${VALUES[$idx]}"
        # non-empty values need to be preceded by an equals sign
        [ -n "${valueRegex}" ] && valueRegex="=${valueRegex}"
        # add an equals sign to non-empty values
        [ -n "${defaultValue}" ] && defaultValue="=${defaultValue}"

        # fix the value for 'option' if one exists but does not match 'valueRegex'
        if grep -q -P "^\\s*password\\s+required\\s+pam_unix.so(\\s.+)?\\s+${VALUE_NAMES[$idx]}(?"'!'"${valueRegex}(\\s|\$))" < "/etc/pam.d/common-password" ; then
            sed --follow-symlinks -i -E -e "s/^(\\s*password\\s+required\\s+pam_unix.so(\\s.+)?\\s)${VALUE_NAMES[$idx]}=[^[:space:]]*/\\1${VALUE_NAMES[$idx]}${defaultValue}/" "/etc/pam.d/common-password"

        # add 'option=default' if option is not set
        elif grep -q -E "^\\s*password\\s+required\\s+pam_unix.so" < "/etc/pam.d/common-password" &&
                grep    -E "^\\s*password\\s+required\\s+pam_unix.so" < "/etc/pam.d/common-password" | grep -q -E -v "\\s${VALUE_NAMES[$idx]}(=|\\s|\$)" ; then

            sed --follow-symlinks -i -E -e "s/^(\\s*password\\s+required\\s+pam_unix.so[^\\n]*)/\\1 ${VALUE_NAMES[$idx]}${defaultValue}/" "/etc/pam.d/common-password"
        # add a new entry if none exists
        elif ! grep -q -P "^\\s*password\\s+required\\s+pam_unix.so(\\s.+)?\\s+${VALUE_NAMES[$idx]}${valueRegex}(\\s|\$)" < "/etc/pam.d/common-password" ; then
            echo "password required pam_unix.so ${VALUE_NAMES[$idx]}${defaultValue}" >> "/etc/pam.d/common-password"
        fi
    else
        echo "/etc/pam.d/common-password doesn't exist" >&2
    fi
done

for idx in "${!ARGS[@]}"
do
    if ! grep -q -P "^\s*password\s+required\s+pam_unix.so.*\s+${ARGS[$idx]}\s*$" /etc/pam.d/common-password ; then
        sed --follow-symlinks -i -E -e "s/^\\s*password\\s+required\\s+pam_unix.so.*\$/& ${NEW_ARGS[$idx]}/" /etc/pam.d/common-password
    fi
done