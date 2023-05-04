# platform = Google Chromium Browser






if ! grep -q AllowOutdatedPlugins /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'AllowOutdatedPlugins'": 'false',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'AllowOutdatedPlugins'.*/\"'AllowOutdatedPlugins'\": 'false',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi