description: 'This profile contains rules to ensure standard security baseline

    of an openSUSE system. Regardless of your system''s workload

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
title: Standard System Security Profile for openSUSE
definition_location: /home/oscap/content/products/opensuse/profiles/standard.profile
documentation_complete: true
