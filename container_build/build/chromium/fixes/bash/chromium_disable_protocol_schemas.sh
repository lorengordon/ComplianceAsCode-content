# platform = Google Chromium Browser

var_url_blacklist='(bash-populate var_url_blacklist)'


var_url_blacklist_modified="$(echo ${var_url_blacklist}| sed 's/\//\\\/\\/')"




if ! grep -q URLBlacklist /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'URLBlacklist'": '\[${var_url_blacklist}\]',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'URLBlacklist'.*/\"'URLBlacklist'\": '\[${var_url_blacklist_modified}\]',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi