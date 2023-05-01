# platform = Google Chromium Browser






if ! grep -q CloudPringProxyEnabled /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'CloudPringProxyEnabled'": 'false',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'CloudPringProxyEnabled'.*/\"'CloudPringProxyEnabled'\": 'false',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi