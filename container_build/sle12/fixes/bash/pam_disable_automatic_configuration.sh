# platform = multi_platform_sle

while IFS= read -r -d '' link; do
    target=$(readlink -f "$link")
    cp -p --remove-destination "$target" "$link"
done <   <(find /etc/pam.d/ -type l -iname "common-*" -print0)