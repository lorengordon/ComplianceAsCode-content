# platform = multi_platform_all
# reboot = false
# strategy = enable
# complexity = low
# disruption = low
include enable_chrony

class enable_chrony {
  service {'chrony':
    enable => true,
    ensure => 'running',
  }
}