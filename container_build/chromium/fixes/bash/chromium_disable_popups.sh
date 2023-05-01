# platform = Google Chromium Browser






if ! grep -q DefaultPopupsSetting /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'DefaultPopupsSetting'": '2',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'DefaultPopupsSetting'.*/\"'DefaultPopupsSetting'\": '2',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi