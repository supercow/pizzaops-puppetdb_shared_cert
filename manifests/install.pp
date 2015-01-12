# == Class puppetdb_shared_cert::install
#
# This class is called from puppetdb_shared_cert for install.
#
class puppetdb_shared_cert::install {

  package { $::puppetdb_shared_cert::package_name:
    ensure => present,
  }
}
