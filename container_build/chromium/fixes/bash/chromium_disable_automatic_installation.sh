# platform = Google Chromium Browser






if ! grep -q DisablePluginFinder /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'DisablePluginFinder'": 'true',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'DisablePluginFinder'.*/\"'DisablePluginFinder'\": 'true',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi