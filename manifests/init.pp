define pe_shared_cert (
  $certname = $name,
) {

  validate_string($certname)
  validate_array($dns_alt_names)

  if file("/etc/puppetlabs/puppet/ssl/private_keys/${certname}.pem",'/dev/null') == '' {
    fail("Pe_shared_cert[${certname}] requires that a private key is pre-generated. Please ensure that Pe_shared_cert::Ca[${certname}] is applied to the CA, and that the CA is the Puppet Master for this agent run.")
  }

  file { "${certname}-cert":
    ensure  => file,
    content => file("/etc/puppetlabs/puppet/ssl/certs/${certname}.pem"),
    path    => "/etc/puppetlabs/puppet/ssl/certs/${certname}.pem",
    mode    => '0644',
    owner   => 'pe-puppet',
    group   => 'pe-puppet'
  }
  file { "${certname}-private-key":
    ensure  => file,
    content => file("/etc/puppetlabs/puppet/ssl/private_keys/${certname}.pem"),
    path    => "/etc/puppetlabs/puppet/ssl/private_keys/${certname}.pem",
    mode    => '0640',
    owner   => 'pe-puppet',
    group   => 'pe-puppet'
  }
  file { "${certname}-public-key":
    ensure  => file,
    content => file("/etc/puppetlabs/puppet/ssl/public_keys/${certname}.pem"),
    path    => "/etc/puppetlabs/puppet/ssl/public_keys/${certname}.pem",
    mode    => '0644',
    owner   => 'pe-puppet',
    group   => 'pe-puppet'
  }
}

