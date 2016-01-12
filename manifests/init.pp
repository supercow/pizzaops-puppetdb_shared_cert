define pe_shared_cert (
  $certname  = $name,
  $key_owner = 'root',
  $key_group = '0',
) {

  validate_string($certname)

  if file("/etc/puppetlabs/puppet/ssl/private_keys/${certname}.pem",'/dev/null') == '' {
    fail("Pe_shared_cert[${certname}] requires that a private key is pre-generated. Please ensure that Pe_shared_cert::Ca[${certname}] is applied to the CA, and that the CA is the Puppet Master for this agent run.")
  }

  file { "${certname}-cert":
    ensure  => file,
    content => file("/etc/puppetlabs/puppet/ssl/certs/${certname}.pem"),
    path    => "/etc/puppetlabs/puppet/ssl/certs/${certname}.pem",
    mode    => '0644',
    owner   => $key_owner,
    group   => $key_group,
  }
  file { "${certname}-private-key":
    ensure  => file,
    content => file("/etc/puppetlabs/puppet/ssl/private_keys/${certname}.pem"),
    path    => "/etc/puppetlabs/puppet/ssl/private_keys/${certname}.pem",
    mode    => '0640',
    owner   => $key_owner,
    group   => $key_group,
  }
  file { "${certname}-public-key":
    ensure  => file,
    content => file("/etc/puppetlabs/puppet/ssl/public_keys/${certname}.pem"),
    path    => "/etc/puppetlabs/puppet/ssl/public_keys/${certname}.pem",
    mode    => '0644',
    owner   => $key_owner,
    group   => $key_group,
  }
}

