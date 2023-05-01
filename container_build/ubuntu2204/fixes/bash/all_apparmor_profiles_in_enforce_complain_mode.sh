# platform = multi_platform_sle,multi_platform_ubuntu
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

var_apparmor_mode='(bash-populate var_apparmor_mode)'


# make sure apparmor-utils is installed for aa-complain and aa-enforce
DEBIAN_FRONTEND=noninteractive apt-get install -y "apparmor-utils"

# Reload all AppArmor profiles
apparmor_parser -q -r /etc/apparmor.d/

# Set the mode
APPARMOR_MODE="$var_apparmor_mode"

if [ "$APPARMOR_MODE" = "enforce" ]
then
  # Set all profiles to enforce mode
  aa-enforce /etc/apparmor.d/*
fi

if [ "$APPARMOR_MODE" = "complain" ]
then
  # Set all profiles to complain mode
  aa-complain /etc/apparmor.d/*
fi


UNCONFINED=$(aa-status | grep "processes are unconfined" | awk '{print $1;}')
if [ $UNCONFINED -ne 0 ];

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