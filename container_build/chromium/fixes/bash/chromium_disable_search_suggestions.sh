# platform = Google Chromium Browser






if ! grep -q SearchSuggestEnabled /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'SearchSuggestEnabled'": 'false',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'SearchSuggestEnabled'.*/\"'SearchSuggestEnabled'\": 'false',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi