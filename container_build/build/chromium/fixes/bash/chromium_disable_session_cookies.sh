# platform = Google Chromium Browser






if ! grep -q CookiesSessionOnlyForUrls /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'CookiesSessionOnlyForUrls'": '\[none\]',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'CookiesSessionOnlyForUrls'.*/\"'CookiesSessionOnlyForUrls'\": '\[none\]',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi