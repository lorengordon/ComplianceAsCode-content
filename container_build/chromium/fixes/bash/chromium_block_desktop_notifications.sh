# platform = Google Chromium Browser






if ! grep -q DefaultNotificationsSetting /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'DefaultNotificationsSetting'": '2',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'DefaultNotificationsSetting'.*/\"'DefaultNotificationsSetting'\": '2',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi