# platform = multi_platform_all

var_accounts_user_umask='(bash-populate var_accounts_user_umask)'






grep -q "^\s*umask" /etc/bashrc && \
  sed -i -E -e "s/^(\s*umask).*/\1 $var_accounts_user_umask/g" /etc/bashrc
if ! [ $? -eq 0 ]; then
    echo "umask $var_accounts_user_umask" >> /etc/bashrc
fi