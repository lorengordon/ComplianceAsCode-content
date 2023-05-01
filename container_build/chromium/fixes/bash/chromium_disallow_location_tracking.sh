# platform = Google Chromium Browser






if ! grep -q DefaultGeolocationSetting /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'DefaultGeolocationSetting'": '2',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'DefaultGeolocationSetting'.*/\"'DefaultGeolocationSetting'\": '2',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi