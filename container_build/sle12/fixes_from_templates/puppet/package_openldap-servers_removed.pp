# platform = multi_platform_all
# reboot = false
# strategy = disable
# complexity = low
# disruption = low
include remove_openldap2

class remove_openldap2 {
  package { 'openldap2':
    ensure => 'purged',
  }
}