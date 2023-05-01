# platform = Google Chromium Browser






if ! grep -q SyncDisabled /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'SyncDisabled'": 'true',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'SyncDisabled'.*/\"'SyncDisabled'\": 'true',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi