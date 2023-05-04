# platform = multi_platform_all
# reboot = false
# strategy = disable
# complexity = low
# disruption = low
include remove_avahi-daemon

class remove_avahi-daemon {
  package { 'avahi-daemon':
    ensure => 'purged',
  }
}