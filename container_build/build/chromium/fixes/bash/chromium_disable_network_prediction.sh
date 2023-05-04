# platform = Google Chromium Browser






if ! grep -q DnsPrefetchingEnabled /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'DnsPrefetchingEnabled'": 'false',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'DnsPrefetchingEnabled'.*/\"'DnsPrefetchingEnabled'\": 'false',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi