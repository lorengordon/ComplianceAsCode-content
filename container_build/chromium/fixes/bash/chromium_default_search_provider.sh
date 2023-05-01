# platform = Google Chromium Browser






if ! grep -q DefaultSearchProviderEnabled /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'DefaultSearchProviderEnabled'": 'true',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'DefaultSearchProviderEnabled'.*/\"'DefaultSearchProviderEnabled'\": 'true',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi