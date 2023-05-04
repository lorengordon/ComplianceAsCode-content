# platform = Google Chromium Browser






if ! grep -q Disable3DAPIs /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'Disable3DAPIs'": 'true',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'Disable3DAPIs'.*/\"'Disable3DAPIs'\": 'true',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi