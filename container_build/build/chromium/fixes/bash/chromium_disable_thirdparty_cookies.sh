# platform = Google Chromium Browser






if ! grep -q BlockThirdPartyCookies /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'BlockThirdPartyCookies'": 'true',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'BlockThirdPartyCookies'.*/\"'BlockThirdPartyCookies'\": 'true',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi