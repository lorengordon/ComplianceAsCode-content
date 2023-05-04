# platform = multi_platform_all
# reboot = false
# strategy = restrict
# complexity = low
# disruption = low

while IFS= read -r dir; do
    while IFS= read -r -d '' file; do
        if [ "$(basename $file)" != ".bash_history" ]; then
            sed -i 's/^\([\s]*umask\s*\)/#\1/g' "$file"
        fi
    done <   <(find $dir -maxdepth 1 -type f -name ".*" -print0)
done <   <(awk -F':' '{ if ($3 >= 1000 && $3 != 65534) print $6}' /etc/passwd)