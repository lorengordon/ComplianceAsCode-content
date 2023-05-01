# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
var_spec_store_bypass_disable_options='(bash-populate var_spec_store_bypass_disable_options)'



grubby --update-kernel=ALL --args=spec_store_bypass_disable=$var_spec_store_bypass_disable_options --env=/boot/grub2/grubenv
