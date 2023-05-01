# platform = Google Chromium Browser






if ! grep -q AutoFillEnabled /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'AutoFillEnabled'": 'false',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'AutoFillEnabled'.*/\"'AutoFillEnabled'\": 'false',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi