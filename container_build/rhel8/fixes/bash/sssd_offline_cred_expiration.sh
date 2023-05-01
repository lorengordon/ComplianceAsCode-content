# platform = Red Hat Virtualization 4,multi_platform_fedora,multi_platform_ol,multi_platform_rhel,multi_platform_sle
# reboot = false
# strategy = configure
# complexity = low
# disruption = medium
# Remediation is applicable only in certain platforms
if rpm --quiet -q sssd-common && { [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; }; then

found=false

# set value in all files if they contain section or key
for f in $(echo -n "/etc/sssd/sssd.conf"); do
    if [ ! -e "$f" ]; then
        continue
    fi

    # find key in section and change value
    if grep -qzosP "[[:space:]]*\[pam\]([^\n\[]*\n+)+?[[:space:]]*offline_credentials_expiration" "$f"; then
            sed -i "s/offline_credentials_expiration[^(\n)]*/offline_credentials_expiration = 1/" "$f"
            found=true

    # find section and add key = value to it
    elif grep -qs "[[:space:]]*\[pam\]" "$f"; then
            sed -i "/[[:space:]]*\[pam\]/a offline_credentials_expiration = 1" "$f"
            found=true
    fi
done

# if section not in any file, append section with key = value to FIRST file in files parameter
if ! $found ; then
    file=$(echo "/etc/sssd/sssd.conf" | cut -f1 -d ' ')
    mkdir -p "$(dirname "$file")"
    echo -e "[pam]\noffline_credentials_expiration = 1" >> "$file"
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi