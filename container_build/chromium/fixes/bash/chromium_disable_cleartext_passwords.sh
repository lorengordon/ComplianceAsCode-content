# platform = Google Chromium Browser






if ! grep -q PasswordManagerAllowShowPasswords /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'PasswordManagerAllowShowPasswords'": 'false',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'PasswordManagerAllowShowPasswords'.*/\"'PasswordManagerAllowShowPasswords'\": 'false',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi