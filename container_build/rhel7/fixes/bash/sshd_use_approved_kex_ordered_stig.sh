# platform = Red Hat Enterprise Linux 7,Oracle Linux 7
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

KEX_ALGOS="ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,\
diffie-hellman-group-exchange-sha256"

if grep -q -P '^\s*KexAlgorithms\s+' /etc/ssh/sshd_config; then
  sed -i "s/^\s*KexAlgorithms.*/KexAlgorithms ${KEX_ALGOS}/" /etc/ssh/sshd_config
else
  echo "KexAlgorithms ${KEX_ALGOS}" >> /etc/ssh/sshd_config
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi