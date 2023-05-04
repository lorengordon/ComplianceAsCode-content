# platform = Google Chromium Browser






if ! grep -q PasswordManagerEnabled /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'PasswordManagerEnabled'": 'false',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'PasswordManagerEnabled'.*/\"'PasswordManagerEnabled'\": 'false',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi