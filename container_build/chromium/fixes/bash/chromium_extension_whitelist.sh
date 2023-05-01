# platform = Google Chromium Browser

var_extension_whitelist='(bash-populate var_extension_whitelist)'


var_extension_whitelist_modified="$(echo ${var_extension_whitelist} | sed 's/\//\\\/\\/')"




if ! grep -q ExtensionInstallWhitelist /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'ExtensionInstallWhitelist'": '${var_extension_whitelist}',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'ExtensionInstallWhitelist'.*/\"'ExtensionInstallWhitelist'\": '${var_extension_whitelist_modified}',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi