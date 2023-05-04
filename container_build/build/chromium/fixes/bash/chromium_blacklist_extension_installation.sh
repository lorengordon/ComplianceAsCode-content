# platform = Google Chromium Browser






if ! grep -q ExtensionInstallBlocklist /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'ExtensionInstallBlocklist'": '[ "*" ]',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'ExtensionInstallBlocklist'.*/\"'ExtensionInstallBlocklist'\": '[ "*" ]',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi