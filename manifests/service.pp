# == Class puppetdb_shared_cert::service
#
# This class is meant to be called from puppetdb_shared_cert.
# It ensure the service is running.
#
class puppetdb_shared_cert::service {

  service { $::puppetdb_shared_cert::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
