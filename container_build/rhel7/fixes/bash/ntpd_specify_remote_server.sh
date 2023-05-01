# platform = multi_platform_fedora,Red Hat Enterprise Linux 7
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ] && { rpm --quiet -q ntp; }; then

var_multiple_time_servers='(bash-populate var_multiple_time_servers)'


config_file="/etc/ntp.conf"

if ! grep -q '^[\s]*(?:server|pool)[\s]+[\w]+' "$config_file" ; then
          if ! grep -q '#[[:space:]]*server' "$config_file" ; then
    for server in $(echo "$var_multiple_time_servers" | tr ',' '\n') ; do
      printf '\nserver %s' "$server" >> "$config_file"
    done
  else
    sed -i 's/#[ \t]*server/server/g' "$config_file"
  fi
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi