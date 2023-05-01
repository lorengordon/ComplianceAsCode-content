# platform = multi_platform_all
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

#!/bin/bash

FAILLOCK_CONF_FILES="/etc/security/faillock.conf /etc/pam.d/system-auth /etc/pam.d/password-auth"
faillock_dirs=$(grep -oP "^\s*(?:auth.*pam_faillock.so.*)?dir\s*=\s*(\S+)" $FAILLOCK_CONF_FILES \
               | sed -r 's/.*=\s*(\S+)/\1/')

if [ -n "$faillock_dirs" ]; then
    for dir in $faillock_dirs; do
        if ! semanage fcontext -a -t faillog_t "$dir(/.*)?"; then
            semanage fcontext -m -t faillog_t "$dir(/.*)?"
        fi
        if [ ! -e $dir ]; then
            mkdir -p $dir
        fi
        restorecon -R -v $dir
    done
else
echo "
The pam_faillock.so dir option is not set in the system.
If this is not expected, make sure pam_faillock.so is properly configured."
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi