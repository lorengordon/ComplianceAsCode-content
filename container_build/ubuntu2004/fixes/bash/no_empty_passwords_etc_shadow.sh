# platform = multi_platform_ol,multi_platform_sle,multi_platform_ubuntu
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

readarray -t users_with_empty_pass < <(sudo awk -F: '!$2 {print $1}' /etc/shadow)

for user_with_empty_pass in "${users_with_empty_pass[@]}"
do
    passwd -l $user_with_empty_pass
done

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi