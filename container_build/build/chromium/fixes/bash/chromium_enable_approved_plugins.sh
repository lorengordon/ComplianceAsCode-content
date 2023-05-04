# platform = Google Chromium Browser

var_enable_approved_plugins='(bash-populate var_enable_approved_plugins)'


# set var to empty string if None
if [ "$var_enable_approved_plugins" = "None" ]; then
    var_enable_approved_plugins=""
fi

var_enable_approved_plugins_modified="$(echo ${var_enable_approved_plugins} | sed 's/\//\\\/\\/')"




if ! grep -q EnabledPlugins /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'EnabledPlugins'": '\[${var_enable_approved_plugins}\]',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'EnabledPlugins'.*/\"'EnabledPlugins'\": '\[${var_enable_approved_plugins_modified}\]',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi