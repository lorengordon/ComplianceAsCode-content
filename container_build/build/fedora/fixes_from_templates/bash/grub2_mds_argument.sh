# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
var_mds_options='(bash-populate var_mds_options)'



grubby --update-kernel=ALL --args=mds=$var_mds_options
