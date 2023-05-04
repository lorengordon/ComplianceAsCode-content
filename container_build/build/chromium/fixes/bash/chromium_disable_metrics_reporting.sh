# platform = Google Chromium Browser






if ! grep -q MetricsReportingEnabled /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'MetricsReportingEnabled'": 'false',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'MetricsReportingEnabled'.*/\"'MetricsReportingEnabled'\": 'false',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi