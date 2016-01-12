# == Define: pe_shared_certs::ca
#
#  Generate shared cert data for shared PE certs. Each shared cert should
#  have one of these declared on the CA/Master of Masters.
#
# === Parameters
#
# [*certname*]
#   Primary certname for the shared cert.
#
# [*dns_alt_names*]
#   Array of subject alternative names for the shared cert. Should include
#   loadbalancer's DNS name.

define pe_shared_cert::ca (
  $certname = $name,
  $dns_alt_names = [],
) {

  validate_string($certname)
  validate_array($dns_alt_names)

  puppet_certificate { $certname:
    ensure        => present,
    dns_alt_names => $dns_alt_names,
  }
}
