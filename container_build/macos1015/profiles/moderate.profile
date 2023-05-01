description: 'This compliance profile reflects the core set of Moderate-Impact Baseline

    configuration settings for deployment of Apple macOS 10.15 Catalina

    into U.S. Defense, Intelligence, and Civilian agencies.

    Development partners and sponsors include the U.S. National Institute

    of Standards and Technology (NIST), U.S. Department of Defense, and the

    the National Security Agency.


    This baseline implements configuration requirements from the following

    sources:


    - NIST 800-53 control selections for Moderate-Impact systems (NIST 800-53)


    For any differing configuration requirements, e.g. password lengths, the stricter

    security setting was chosen. Security Requirement Traceability Guides (RTMs) and

    sample System Security Configuration Guides are provided via the

    scap-security-guide-docs package.


    This profile reflects U.S. Government consensus content and is developed through

    the ComplianceAsCode initiative, championed by the National

    Security Agency. Except for differences in formatting to accommodate

    publishing processes, this profile mirrors ComplianceAsCode

    content as minor divergences, such as bugfixes, work through the

    consensus and release processes.'
extends: null
metadata: null
reference: null
selections:
- audit_failure_halt
- service_com_apple_auditd_enabled
unselected_groups: []
platforms: !!set {}
cpe_names: !!set {}
platform: null
filter_rules: ''
title: NIST 800-53 Moderate-Impact Baseline for Apple macOS 10.15 Catalina
definition_location: /home/oscap/content/products/macos1015/profiles/moderate.profile
documentation_complete: true
