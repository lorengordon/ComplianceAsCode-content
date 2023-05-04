# platform = Google Chromium Browser






if ! grep -q RemoteAccessHostFirewallTraversal /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'RemoteAccessHostFirewallTraversal'": 'false',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'RemoteAccessHostFirewallTraversal'.*/\"'RemoteAccessHostFirewallTraversal'\": 'false',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi