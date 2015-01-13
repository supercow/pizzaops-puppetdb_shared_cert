# == Class: puppetdb_shared_cert
#
#  Shared data class for puppetdb_shared_cert.
#
# === Parameters
#
# [*certname*]
#   Primary certname for shared PuppetDB cert.
#
# [*dns_alt_names*]
#   Array of subject alternative names for shared PuppetDB cert. Should include
#   loadbalancer's DNS name.

class puppetdb_shared_cert (
  $certname = $::puppetdb_shared_cert::params::certname,
  $dns_alt_names = $::puppetdb_shared_cert::params::dns_alt_names,
) inherits ::puppetdb_shared_cert::params {

  # validate parameters here
  validate_string($certname)
  validate_array($dns_alt_names)

}
