# platform = multi_platform_all
# Remediation is applicable only in certain platforms
if rpm --quiet -q gdm; then

login_banner_text='(bash-populate login_banner_text)'


# Multiple regexes transform the banner regex into a usable banner
# 0 - Remove anchors around the banner text
login_banner_text=$(echo "$login_banner_text" | sed 's/^\^\(.*\)\$$/\1/g')
# 1 - Keep only the first banners if there are multiple
#    (dod_banners contains the long and short banner)
login_banner_text=$(echo "$login_banner_text" | sed 's/^(\(.*\.\)|.*)$/\1/g')
# 2 - Add spaces ' '. (Transforms regex for "space or newline" into a " ")
login_banner_text=$(echo "$login_banner_text" | sed 's/\[\\s\\n\]+/ /g')
# 3 - Adds newline "tokens". (Transforms "(?:\[\\n\]+|(?:\\n)+)" into "(n)*")
login_banner_text=$(echo "$login_banner_text" | sed 's/(?:\[\\n\]+|(?:\\\\n)+)/(n)*/g')
# 4 - Remove any leftover backslash. (From any parethesis in the banner, for example).
login_banner_text=$(echo "$login_banner_text" | sed 's/\\//g')
# 5 - Removes the newline "token." (Transforms them into newline escape sequences "\n").
#    ( Needs to be done after 4, otherwise the escapce sequence will become just "n".
login_banner_text=$(echo "$login_banner_text" | sed 's/(n)\*/\\n/g')

# Check for setting in any of the DConf db directories
# If files contain ibus or distro, ignore them.
# The assignment assumes that individual filenames don't contain :
readarray -t SETTINGSFILES < <(grep -r "\\[org/gnome/login-screen\\]" "/etc/dconf/db/" \
                                | grep -v 'distro\|ibus\|gdm.d' | cut -d":" -f1)
DCONFFILE="/etc/dconf/db/gdm.d/00-security-settings"
DBDIR="/etc/dconf/db/gdm.d"

mkdir -p "${DBDIR}"

# Comment out the configurations in databases different from the target one
if [ "${#SETTINGSFILES[@]}" -ne 0 ]
then
    if grep -q "^\\s*banner-message-text\\s*=" "${SETTINGSFILES[@]}"
    then
        
        sed -Ei "s/(^\s*)banner-message-text(\s*=)/#\1banner-message-text\2/g" "${SETTINGSFILES[@]}"
    fi
fi


[ ! -z "${DCONFFILE}" ] && echo "" >> "${DCONFFILE}"
if ! grep -q "\\[org/gnome/login-screen\\]" "${DCONFFILE}"
then
    printf '%s\n' "[org/gnome/login-screen]" >> ${DCONFFILE}
fi

escaped_value="$(sed -e 's/\\/\\\\/g' <<< "'${login_banner_text}'")"
if grep -q "^\\s*banner-message-text\\s*=" "${DCONFFILE}"
then
        sed -i "s/\\s*banner-message-text\\s*=\\s*.*/banner-message-text=${escaped_value}/g" "${DCONFFILE}"
    else
        sed -i "\\|\\[org/gnome/login-screen\\]|a\\banner-message-text=${escaped_value}" "${DCONFFILE}"
fi

dconf update
# Check for setting in any of the DConf db directories
LOCKFILES=$(grep -r "^/org/gnome/login-screen/banner-message-text$" "/etc/dconf/db/" \
            | grep -v 'distro\|ibus\|gdm.d' | grep ":" | cut -d":" -f1)
LOCKSFOLDER="/etc/dconf/db/gdm.d/locks"

mkdir -p "${LOCKSFOLDER}"

# Comment out the configurations in databases different from the target one
if [[ ! -z "${LOCKFILES}" ]]
then
    sed -i -E "s|^/org/gnome/login-screen/banner-message-text$|#&|" "${LOCKFILES[@]}"
fi

if ! grep -qr "^/org/gnome/login-screen/banner-message-text$" /etc/dconf/db/gdm.d/
then
    echo "/org/gnome/login-screen/banner-message-text" >> "/etc/dconf/db/gdm.d/locks/00-security-settings-lock"
fi

dconf update

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi