# platform = multi_platform_all
# complexity = low
# disruption = low
# reboot = false
# strategy = restrict

var_account_disable_post_pw_expiration='(bash-populate var_account_disable_post_pw_expiration)'


while IFS= read -r i; do
    chage --inactive $var_account_disable_post_pw_expiration $i
done <   <(awk -v var="$var_account_disable_post_pw_expiration" -F: '(($7 > var || $7 == "") && $2 ~ /^\$/) {print $1}' /etc/shadow)