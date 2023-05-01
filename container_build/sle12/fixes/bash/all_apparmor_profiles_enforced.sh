# platform = multi_platform_sle,multi_platform_ubuntu
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

# make sure apparmor-utils is installed for aa-complain and aa-enforce
zypper install -y "apparmor-utils"

# Ensure all AppArmor Profiles are enforcing
apparmor_parser -q -r /etc/apparmor.d/
aa-enforce /etc/apparmor.d/*


UNCONFINED=$(aa-unconfined)
if [ ! -z "$UNCONFINED" ]

then
  echo -e "***WARNING***: There are some unconfined processes:"
  echo -e "----------------------------"
  echo "The may need to have a profile created or activated for them and then be restarted."
  for PROCESS in "${UNCONFINED[@]}"
  do
      echo "$PROCESS"
  done
  echo -e "----------------------------"
  echo "The may need to have a profile created or activated for them and then be restarted."
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi