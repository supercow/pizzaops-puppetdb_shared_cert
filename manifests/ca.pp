# == Class: puppetdb_shared_cert::generate
#
#  Generate shared cert data for PuppetDB. You should classify your CA node
#  with this class.
#
# === Parameters
#
# [*certname*]
#   Primary certname for shared PuppetDB cert.
#
# [*dns_alt_names*]
#   Array of subject alternative names for shared PuppetDB cert. Should include
#   loadbalancer's DNS name.

class puppetdb_shared_cert::ca (
  $certname = $puppetdb_shared_cert::certname,
  $dns_alt_names = $puppetdb_shared_cert::dns_alt_names
) inherits puppetdb_shared_cert {

  validate_string($certname)
  validate_array($dns_alt_names)

  puppet_certificate { $certname:
    ensure        => present,
    dns_alt_names => $dns_alt_names,
  }
}
