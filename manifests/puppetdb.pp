class puppetdb_shared_cert::puppetdb (
  $certname = $puppetdb_shared_cert::certname,
  $dns_alt_names = $puppetdb_shared_cert::dns_alt_names,
  $cert_owner = 'pe-puppetdb',
  $cert_group = 'pe-puppetdb',
) inherits puppetdb_shared_cert {

  validate_string($certname)
  validate_array($dns_alt_names)

  unless $::settings::ca_server == $::settings::certname {
    fail('puppetdb_shared_cert::puppetdb only functions when compiled on the CA master. It cannot be used in a run against a compile master.')
  }

  file { 'puppetdb-shared-certificate':
    ensure  => file,
    content => file("/etc/puppetlabs/puppet/ssl/certs/${certname}.pem"),
    path    => "/etc/puppetlabs/puppet/ssl/certs/${certname}.pem",
    mode    => '0644',
    owner   => $cert_owner,
    group   => $cert_group
  }
  file { 'puppetdb-shared-publickey':
    ensure  => file,
    content => file("/etc/puppetlabs/puppet/ssl/private_keys/${certname}.pem"),
    path    => "/etc/puppetlabs/puppet/ssl/private_keys/${certname}.pem",
    mode    => '0644',
    owner   => $cert_owner,
    group   => $cert_group
  }
  file { 'puppetdb-shared-privatekey':
    ensure  => file,
    content => file("/etc/puppetlabs/puppet/ssl/public_keys/${certname}.pem"),
    path    => "/etc/puppetlabs/puppet/ssl/public_keys/${certname}.pem",
    mode    => '0644',
    owner   => $cert_owner,
    group   => $cert_group
  }

  Class['puppetdb_shared_cert::puppetdb'] -> Puppet_enterprise::Certs['pe-puppetdb']
}

