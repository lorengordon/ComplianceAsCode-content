description: 'This profile contains rules to ensure standard security baseline

    of a SUSE Linux Enterprise 12 system. Regardless of your system''s workload

    all of these checks should pass.'
extends: null
metadata: null
reference: null
selections:
- file_groupowner_etc_passwd
- file_owner_etc_passwd
- file_permissions_etc_passwd
unselected_groups: []
platforms: !!set {}
cpe_names: !!set {}
platform: null
filter_rules: ''
title: Standard System Security Profile for SUSE Linux Enterprise 12
definition_location: /home/oscap/content/products/sle12/profiles/standard.profile
documentation_complete: true
