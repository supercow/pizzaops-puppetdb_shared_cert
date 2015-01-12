# == Class: puppetdb_shared_cert
#
# Full description of class puppetdb_shared_cert here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class puppetdb_shared_cert (
  $package_name = $::puppetdb_shared_cert::params::package_name,
  $service_name = $::puppetdb_shared_cert::params::service_name,
) inherits ::puppetdb_shared_cert::params {

  # validate parameters here

  class { '::puppetdb_shared_cert::install': } ->
  class { '::puppetdb_shared_cert::config': } ~>
  class { '::puppetdb_shared_cert::service': } ->
  Class['::puppetdb_shared_cert']
}
