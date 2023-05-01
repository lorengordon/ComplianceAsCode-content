description: 'This profile contains rules to ensure standard security baseline

    of a Alibaba Cloud Linux 2 system. Regardless of your system''s workload

    all of these checks should pass.'
extends: null
metadata: null
reference: null
selections:
- aide_build_database
- audit_rules_file_deletion_events
- audit_rules_kernel_module_loading
- audit_rules_login_events
- audit_rules_unsuccessful_file_modification
- chronyd_or_ntpd_specify_remote_server
- configure_bind_crypto_policy
- configure_crypto_policy
- configure_kerberos_crypto_policy
- configure_libreswan_crypto_policy
- configure_openssl_crypto_policy
- configure_ssh_crypto_policy
- ensure_gpgcheck_globally_activated
- ensure_gpgcheck_never_disabled
- grub2_audit_argument
- grub2_nousb_argument
- package_openldap-clients_removed
- rpm_verify_hashes
- rpm_verify_permissions
- service_abrtd_disabled
- service_atd_disabled
- service_autofs_disabled
- service_chronyd_or_ntpd_enabled
- service_firewalld_enabled
- service_ntpdate_disabled
- service_oddjobd_disabled
- service_qpidd_disabled
- service_rdisc_disabled
- set_firewalld_default_zone
unselected_groups: []
platforms: !!set {}
cpe_names: !!set {}
platform: null
filter_rules: ''
title: Standard System Security Profile for Alibaba Cloud Linux 2
definition_location: /home/oscap/content/products/alinux2/profiles/standard.profile
documentation_complete: true
