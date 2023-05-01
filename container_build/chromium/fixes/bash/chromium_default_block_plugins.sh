# platform = Google Chromium Browser






if ! grep -q DefaultPluginsSetting /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'DefaultPluginsSetting'": '3',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'DefaultPluginsSetting'.*/\"'DefaultPluginsSetting'\": '3',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi