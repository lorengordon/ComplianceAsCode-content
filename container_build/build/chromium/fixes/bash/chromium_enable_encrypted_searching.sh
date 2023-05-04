# platform = Google Chromium Browser

var_enable_encrypted_searching='(bash-populate var_enable_encrypted_searching)'


var_enable_encrypted_searching_modified="$(echo ${var_enable_encrypted_searching} | sed 's/\//\\\/\\/')"




if ! grep -q DefaultSearchProviderSearchURL /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'DefaultSearchProviderSearchURL'": '${var_enable_encrypted_searching}',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'DefaultSearchProviderSearchURL'.*/\"'DefaultSearchProviderSearchURL'\": '${var_enable_encrypted_searching_modified}',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi