# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,Red Hat Virtualization 4
# Remediation is applicable only in certain platforms
if ( [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ] && ! ( [ "${container:-}" == "bwrap-osbuild" ] ) ) && { [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; }; then

var_system_crypto_policy='(bash-populate var_system_crypto_policy)'


fips-mode-setup --enable

stderr_of_call=$(update-crypto-policies --set ${var_system_crypto_policy} 2>&1 > /dev/null)
rc=$?

if test "$rc" = 127; then
	echo "$stderr_of_call" >&2
	echo "Make sure that the script is installed on the remediated system." >&2
	echo "See output of the 'dnf provides update-crypto-policies' command" >&2
	echo "to see what package to (re)install" >&2

	false  # end with an error code
elif test "$rc" != 0; then
	echo "Error invoking the update-crypto-policies script: $stderr_of_call" >&2
	false  # end with an error code
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi