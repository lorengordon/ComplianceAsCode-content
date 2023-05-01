# platform = Oracle Linux 7,Oracle Linux 8

if [ -e "/etc/login.defs" ] ; then
    
    LC_ALL=C sed -i "/^\s*SHA_CRYPT_MIN_ROUNDS\s*/Id" "/etc/login.defs"
else
    printf '%s\n' "Path '/etc/login.defs' wasn't found on this system. Refusing to continue." >&2
    return 1
fi
# make sure file has newline at the end
sed -i -e '$a\' "/etc/login.defs"

cp "/etc/login.defs" "/etc/login.defs.bak"
# Insert at the end of the file
printf '%s\n' "SHA_CRYPT_MIN_ROUNDS 5000" >> "/etc/login.defs"
# Clean up after ourselves.
rm "/etc/login.defs.bak"