# platform = Google Chromium Browser






if ! grep -q EnableOnlineRevocationChecks /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'EnableOnlineRevocationChecks'": 'true',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'EnableOnlineRevocationChecks'.*/\"'EnableOnlineRevocationChecks'\": 'true',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi