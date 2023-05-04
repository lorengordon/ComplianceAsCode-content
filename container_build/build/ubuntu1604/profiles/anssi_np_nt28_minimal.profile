description: This profile contains items to be applied systematically.
extends: null
metadata: null
reference: null
selections:
- apt_conf_disallow_unauthenticated
- file_groupowner_etc_group
- file_groupowner_etc_gshadow
- file_groupowner_etc_passwd
- file_groupowner_etc_shadow
- file_owner_etc_group
- file_owner_etc_gshadow
- file_owner_etc_passwd
- file_owner_etc_shadow
- file_permissions_etc_group
- file_permissions_etc_gshadow
- file_permissions_etc_passwd
- file_permissions_etc_shadow
- package_inetutils-telnetd_removed
- package_nis_removed
- package_telnetd-ssl_removed
- package_telnetd_removed
- sudo_remove_no_authenticate
- sudo_remove_nopasswd
unselected_groups: []
platforms: !!set {}
cpe_names: !!set {}
platform: null
filter_rules: ''
title: Profile for ANSSI DAT-NT28 Minimal Level
definition_location: /home/oscap/content/products/ubuntu1604/profiles/anssi_np_nt28_minimal.profile
documentation_complete: true
