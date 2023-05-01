# platform = multi_platform_sle
# reboot = false
# strategy = enable
# complexity = low
# disruption = low
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ] && { ! grep -q s390x /proc/sys/kernel/osrelease; }; then

SMARTCARD_PACKAGES=( "pam_pkcs11"  "mozilla-nss"  "mozilla-nss-tools"  "pcsc-ccid"  "pcsc-lite"  "pcsc-tools"  "opensc")

for PKGNAME in "${SMARTCARD_PACKAGES[@]}"
do
    zypper install -y "$PKGNAME"
done

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi