# == Class puppetdb_shared_cert::params
#
# This class is meant to be called from puppetdb_shared_cert.
# It sets variables according to platform.
#
class puppetdb_shared_cert::params {
  $certname = 'pe-internal-puppetdb'
  $dns_alt_names = ['puppetdb',"puppetdb.${::domain}"]
}
