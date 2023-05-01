# platform = Google Chromium Browser






if ! grep -q ImportSavedPasswords /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'ImportSavedPasswords'": 'false',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'ImportSavedPasswords'.*/\"'ImportSavedPasswords'\": 'false',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi