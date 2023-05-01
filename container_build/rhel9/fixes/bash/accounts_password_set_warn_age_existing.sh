# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low

var_accounts_password_warn_age_login_defs='(bash-populate var_accounts_password_warn_age_login_defs)'


while IFS= read -r i; do
    chage --warndays $var_accounts_password_warn_age_login_defs $i
done <   <(awk -v var="$var_accounts_password_warn_age_login_defs" -F: '(($6 < var || $6 == "") && $2 ~ /^\$/) {print $1}' /etc/shadow)