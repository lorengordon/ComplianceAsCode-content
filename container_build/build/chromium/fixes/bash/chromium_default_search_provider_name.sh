# platform = Google Chromium Browser

var_default_search_provider_name='(bash-populate var_default_search_provider_name)'


var_default_search_provider_name_modified="$(echo ${var_default_search_provider_name} | sed 's/\//\\\/\\/')"




if ! grep -q DefaultSearchProviderName /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'DefaultSearchProviderName'": '${var_default_search_provider_name}',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'DefaultSearchProviderName'.*/\"'DefaultSearchProviderName'\": '${var_default_search_provider_name_modified}',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi