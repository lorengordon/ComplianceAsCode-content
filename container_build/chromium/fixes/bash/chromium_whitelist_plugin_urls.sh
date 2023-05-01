# platform = Google Chromium Browser






if ! grep -q PluginsAllowedForUrls /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'PluginsAllowedForUrls'": 'none',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'PluginsAllowedForUrls'.*/\"'PluginsAllowedForUrls'\": 'none',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi