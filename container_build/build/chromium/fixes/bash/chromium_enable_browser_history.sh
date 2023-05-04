# platform = Google Chromium Browser






if ! grep -q SavingBrowserHistoryDisabled /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'SavingBrowserHistoryDisabled'": 'false',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'SavingBrowserHistoryDisabled'.*/\"'SavingBrowserHistoryDisabled'\": 'false',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi