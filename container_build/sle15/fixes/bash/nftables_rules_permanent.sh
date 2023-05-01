# platform = SUSE Linux Enterprise 15
# reboot = false
# strategy = restrict
# complexity = low
# disruption = low



var_nftable_master_config_file='(bash-populate var_nftable_master_config_file)'


if [ ! -f "${var_nftable_master_config_file}" ]; then
    touch "${var_nftable_master_config_file}"
fi


grep -qxF 'include "/etc/nftables/bridge-filter"' "${var_nftable_master_config_file}" \
    || echo 'include "/etc/nftables/bridge-filter"' >> "${var_nftable_master_config_file}"

grep -qxF 'include "/etc/nftables/arp-filter"' "${var_nftable_master_config_file}" \
    || echo 'include "/etc/nftables/arp-filter"' >> "${var_nftable_master_config_file}"

grep -qxF 'include "/etc/nftables/inet-filter"' "${var_nftable_master_config_file}" \
    || echo 'include "/etc/nftables/inet-filter"' >> "${var_nftable_master_config_file}"