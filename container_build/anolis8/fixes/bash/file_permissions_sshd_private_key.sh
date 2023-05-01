# platform = multi_platform_all
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

for keyfile in /etc/ssh/*_key; do
    test -f "$keyfile" || continue
    if test root:root = "$(stat -c "%U:%G" "$keyfile")"; then
	chmod u-xs,g-xwrs,o-xwrt "$keyfile"
    
    else
        echo "Key-like file '$keyfile' is owned by an unexpected user:group combination"
    fi
done

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi