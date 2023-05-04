# platform = Google Chromium Browser






if ! grep -q BackgroundModeEnabled /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'BackgroundModeEnabled'": 'false',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'BackgroundModeEnabled'.*/\"'BackgroundModeEnabled'\": 'false',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi