# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol
# Remediation is applicable only in certain platforms
if rpm --quiet -q sssd-common; then

MAIN_CONF="/etc/sssd/conf.d/ospp.conf"

found=false

# set value in all files if they contain section or key
for f in $(echo -n "$MAIN_CONF /etc/sssd/sssd.conf /etc/sssd/conf.d/*.conf"); do
    if [ ! -e "$f" ]; then
        continue
    fi

    # find key in section and change value
    if grep -qzosP "[[:space:]]*\[sssd\]([^\n\[]*\n+)+?[[:space:]]*user" "$f"; then
            sed -i "s/user[^(\n)]*/user = sssd/" "$f"
            found=true

    # find section and add key = value to it
    elif grep -qs "[[:space:]]*\[sssd\]" "$f"; then
            sed -i "/[[:space:]]*\[sssd\]/a user = sssd" "$f"
            found=true
    fi
done

# if section not in any file, append section with key = value to FIRST file in files parameter
if ! $found ; then
    file=$(echo "$MAIN_CONF /etc/sssd/sssd.conf /etc/sssd/conf.d/*.conf" | cut -f1 -d ' ')
    mkdir -p "$(dirname "$file")"
    echo -e "[sssd]\nuser = sssd" >> "$file"
fi

if [ -e "$MAIN_CONF" ]; then
    chown root:root "$MAIN_CONF"
	chmod 600 "$MAIN_CONF"
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi