# platform = Google Chromium Browser

var_auth_schema='(bash-populate var_auth_schema)'







if ! grep -q AuthSchemes /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'AuthSchemes'": '${var_auth_schema}',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'AuthSchemes'.*/\"'AuthSchemes'\": '${var_auth_schema}',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi