# platform = Google Chromium Browser






if ! grep -q AlwaysAuthorizePlugins /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'AlwaysAuthorizePlugins'": 'false',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'AlwaysAuthorizePlugins'.*/\"'AlwaysAuthorizePlugins'\": 'false',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi