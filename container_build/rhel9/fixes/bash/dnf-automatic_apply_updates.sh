# platform = multi_platform_all

found=false

# set value in all files if they contain section or key
for f in $(echo -n "/etc/dnf/automatic.conf"); do
    if [ ! -e "$f" ]; then
        continue
    fi

    # find key in section and change value
    if grep -qzosP "[[:space:]]*\[commands\]([^\n\[]*\n+)+?[[:space:]]*apply_updates" "$f"; then
            sed -i "s/apply_updates[^(\n)]*/apply_updates = yes/" "$f"
            found=true

    # find section and add key = value to it
    elif grep -qs "[[:space:]]*\[commands\]" "$f"; then
            sed -i "/[[:space:]]*\[commands\]/a apply_updates = yes" "$f"
            found=true
    fi
done

# if section not in any file, append section with key = value to FIRST file in files parameter
if ! $found ; then
    file=$(echo "/etc/dnf/automatic.conf" | cut -f1 -d ' ')
    mkdir -p "$(dirname "$file")"
    echo -e "[commands]\napply_updates = yes" >> "$file"
fi