# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,Red Hat Virtualization 4
# Remediation is applicable only in certain platforms
if ( [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ] && ! ( [ "${container:-}" == "bwrap-osbuild" ] ) ); then

fips-mode-setup --enable
FIPS_CONF="/etc/dracut.conf.d/40-fips.conf"
if ! grep "^add_dracutmodules+=\" fips \"" $FIPS_CONF; then
    echo "add_dracutmodules+=\" fips \"" >> $FIPS_CONF
fi

else
    >&2 echo 'Remediation is not applicable, nothing was done'
fi