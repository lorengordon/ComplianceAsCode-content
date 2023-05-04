# platform = multi_platform_all

found=false

# set value in all files if they contain section or key
for f in $(echo -n "/etc/dnf/automatic.conf"); do
    if [ ! -e "$f" ]; then
        continue
    fi

    # find key in section and change value
    if grep -qzosP "[[:space:]]*\[commands\]([^\n\[]*\n+)+?[[:space:]]*upgrade_type" "$f"; then
            sed -i "s/upgrade_type[^(\n)]*/upgrade_type = security/" "$f"
            found=true

    # find section and add key = value to it
    elif grep -qs "[[:space:]]*\[commands\]" "$f"; then
            sed -i "/[[:space:]]*\[commands\]/a upgrade_type = security" "$f"
            found=true
    fi
done

# if section not in any file, append section with key = value to FIRST file in files parameter
if ! $found ; then
    file=$(echo "/etc/dnf/automatic.conf" | cut -f1 -d ' ')
    mkdir -p "$(dirname "$file")"
    echo -e "[commands]\nupgrade_type = security" >> "$file"
fi