# platform = Google Chromium Browser






if ! grep -q IncognitoModeAvailability /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'IncognitoModeAvailability'": 'false',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'IncognitoModeAvailability'.*/\"'IncognitoModeAvailability'\": 'false',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi