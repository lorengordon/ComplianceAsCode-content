description: "This profile contains configurations that align to ANSSI-BP-028 at the\
    \ minimal hardening level.\n\nANSSI is the French National Information Security\
    \ Agency, and stands for Agence nationale de la s\xE9curit\xE9 des syst\xE8mes\
    \ d'information.\nANSSI-BP-028 is a configuration recommendation for GNU/Linux\
    \ systems.\n\nA copy of the ANSSI-BP-028 can be found at the ANSSI website:\n\
    https://www.ssi.gouv.fr/administration/guide/recommandations-de-securite-relatives-a-un-systeme-gnulinux/"
extends: null
metadata: null
reference: null
selections:
- accounts_maximum_age_login_defs
- accounts_password_minlen_login_defs
- dir_perms_world_writable_sticky_bits
- ensure_redhat_gpgkey_installed
- file_permissions_unauthorized_world_writable
- package_sendmail_removed
- sudo_remove_no_authenticate
- sudo_remove_nopasswd
- var_password_pam_unix_rounds=65536
- var_accounts_maximum_age_login_defs=90
- var_password_pam_minlen=18
- var_accounts_password_minlen_login_defs=18
- var_password_pam_ocredit=1
- var_password_pam_dcredit=1
- var_password_pam_ucredit=1
- var_password_pam_lcredit=1
- var_accounts_passwords_pam_faillock_fail_interval=900
- var_accounts_passwords_pam_faillock_deny=3
- var_accounts_passwords_pam_faillock_unlock_time=900
- var_password_pam_unix_remember=2
unselected_groups: []
platforms: !!set {}
cpe_names: !!set {}
platform: null
filter_rules: ''
title: DRAFT - ANSSI-BP-028 (minimal)
definition_location: /home/oscap/content/products/rhcos4/profiles/anssi_bp28_minimal.profile
documentation_complete: true
