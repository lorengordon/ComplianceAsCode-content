# platform = multi_platform_all
# reboot = false
# strategy = disable
# complexity = low
# disruption = low
include remove_rsync

class remove_rsync {
  package { 'rsync':
    ensure => 'purged',
  }
}