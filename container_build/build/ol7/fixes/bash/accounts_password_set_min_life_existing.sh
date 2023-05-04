# platform = Red Hat Virtualization 4,multi_platform_fedora,multi_platform_ol,multi_platform_rhel,multi_platform_sle,multi_platform_ubuntu
# reboot = false
# strategy = restrict
# complexity = low
# disruption = low

var_accounts_minimum_age_login_defs='(bash-populate var_accounts_minimum_age_login_defs)'


while IFS= read -r i; do
    
    chage -m $var_accounts_minimum_age_login_defs $i

done <   <(awk -v var="$var_accounts_minimum_age_login_defs" -F: '(/^[^:]+:[^!*]/ && ($4 < var || $4 == "")) {print $1}' /etc/shadow)