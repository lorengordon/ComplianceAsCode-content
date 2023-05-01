# platform = Google Chromium Browser






if ! grep -q DisabledPlugins /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'DisabledPlugins'": '[ "*" ]',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'DisabledPlugins'.*/\"'DisabledPlugins'\": '[ "*" ]',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi