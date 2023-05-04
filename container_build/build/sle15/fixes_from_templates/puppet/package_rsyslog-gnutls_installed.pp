# platform = multi_platform_all
# reboot = false
# strategy = enable
# complexity = low
# disruption = low
include install_rsyslog-module-gtls

class install_rsyslog-module-gtls {
  package { 'rsyslog-module-gtls':
    ensure => 'installed',
  }
}