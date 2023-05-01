# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_ubuntu,multi_platform_sle
var_rng_core_default_quality='(bash-populate var_rng_core_default_quality)'



grubby --update-kernel=ALL --args=rng_core.default_quality=$var_rng_core_default_quality --env=/boot/grub2/grubenv
