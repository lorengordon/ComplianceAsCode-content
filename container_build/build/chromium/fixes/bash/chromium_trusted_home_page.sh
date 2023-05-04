# platform = Google Chromium Browser

var_trusted_home_page='(bash-populate var_trusted_home_page)'


var_trusted_home_page_modified="$(echo ${var_trusted_home_page} | sed 's/\//\\\/\\/')"




if ! grep -q HomepageLocation /etc/chromium/policies/managed/chrome_stig_policy.json; then
   sed -i -e '/{/a \  "'HomepageLocation'": '${var_trusted_home_page}',' /etc/chromium/policies/managed/chrome_stig_policy.json
else
   sed -i -e 's/\"'HomepageLocation'.*/\"'HomepageLocation'\": '${var_trusted_home_page_modified}',/g' /etc/chromium/policies/managed/chrome_stig_policy.json
fi