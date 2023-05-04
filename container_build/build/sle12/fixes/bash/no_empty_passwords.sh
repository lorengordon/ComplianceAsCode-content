# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_sle
# reboot = false
# strategy = configure
# complexity = low
# disruption = medium
# Remediation is applicable only in certain platforms
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then

PAM_PATH="/etc/pam.d/"
NULLOK_FILES=$(grep -rl ".*pam_unix\\.so.*nullok.*" ${PAM_PATH})
for FILE in ${NULLOK_FILES}; do
   sed --follow-symlinks -i 's/\<nullok\>//g' ${FILE}
done

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi