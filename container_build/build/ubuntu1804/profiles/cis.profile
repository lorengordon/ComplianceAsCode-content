description: 'This baseline aligns to the Center for Internet Security

    Ubuntu 18.04 LTS Benchmark, v1.0.0, released

    08-13-2018.'
extends: null
metadata: null
reference: null
selections:
- audit_rules_mac_modification
- audit_rules_networkconfig_modification
- audit_rules_session_events
- audit_rules_sysadmin_actions
- audit_rules_time_adjtimex
- auditd_data_retention_action_mail_acct
- auditd_data_retention_admin_space_left_action
- auditd_data_retention_max_log_file
- auditd_data_retention_max_log_file_action
- auditd_data_retention_space_left_action
- coredump_disable_backtraces
- coredump_disable_storage
- dir_perms_world_writable_sticky_bits
- disable_host_auth
- file_groupowner_backup_etc_group
- file_groupowner_backup_etc_gshadow
- file_groupowner_backup_etc_passwd
- file_groupowner_backup_etc_shadow
- file_groupowner_etc_group
- file_groupowner_etc_gshadow
- file_groupowner_etc_passwd
- file_groupowner_etc_shadow
- file_owner_backup_etc_group
- file_owner_backup_etc_gshadow
- file_owner_backup_etc_passwd
- file_owner_backup_etc_shadow
- file_owner_etc_group
- file_owner_etc_gshadow
- file_owner_etc_passwd
- file_owner_etc_shadow
- file_permissions_backup_etc_group
- file_permissions_backup_etc_gshadow
- file_permissions_backup_etc_passwd
- file_permissions_backup_etc_shadow
- file_permissions_etc_group
- file_permissions_etc_gshadow
- file_permissions_etc_passwd
- file_permissions_etc_shadow
- file_permissions_unauthorized_world_writable
- kernel_module_cramfs_disabled
- kernel_module_freevxfs_disabled
- kernel_module_hfs_disabled
- kernel_module_hfsplus_disabled
- kernel_module_jffs2_disabled
- kernel_module_rds_disabled
- kernel_module_tipc_disabled
- kernel_module_udf_disabled
- mount_option_home_nodev
- mount_option_tmp_nodev
- mount_option_tmp_nosuid
- mount_option_var_tmp_nodev
- mount_option_var_tmp_noexec
- mount_option_var_tmp_nosuid
- partition_for_home
- partition_for_tmp
- partition_for_var
- partition_for_var_log
- partition_for_var_log_audit
- partition_for_var_tmp
- security_patches_up_to_date
- service_auditd_enabled
- sshd_disable_empty_passwords
- sshd_disable_rhosts
- sshd_disable_root_login
- sshd_do_not_permit_user_env
- sshd_enable_warning_banner
- sshd_set_idle_timeout
- sshd_set_keepalive_0
- sshd_set_loglevel_info
- sshd_set_max_auth_tries
- sysctl_kernel_randomize_va_space
- var_auditd_space_left_action=email
- var_auditd_action_mail_acct=root
- var_auditd_admin_space_left_action=halt
- sshd_max_auth_tries_value=4
- sshd_idle_timeout_value=5_minutes
- var_sshd_set_keepalive=0
unselected_groups: []
platforms: !!set {}
cpe_names: !!set {}
platform: null
filter_rules: ''
title: CIS Ubuntu 18.04 LTS Benchmark
definition_location: /home/oscap/content/products/ubuntu1804/profiles/cis.profile
documentation_complete: true
