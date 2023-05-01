# platform = Google Chromium Browser






if ! grep -q SafeBrowsingEnabled /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'SafeBrowsingEnabled'": 'true',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'SafeBrowsingEnabled'.*/\"'SafeBrowsingEnabled'\": 'true',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi