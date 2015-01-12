# == Class puppetdb_shared_cert::params
#
# This class is meant to be called from puppetdb_shared_cert.
# It sets variables according to platform.
#
class puppetdb_shared_cert::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'puppetdb_shared_cert'
      $service_name = 'puppetdb_shared_cert'
    }
    'RedHat', 'Amazon': {
      $package_name = 'puppetdb_shared_cert'
      $service_name = 'puppetdb_shared_cert'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
