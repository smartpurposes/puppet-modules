class couchbase::install {

  package {$couchbase::params::package:
    ensure => present,
  }

  common::down_resource {'couchbase_get_package':
    scheme   => $couchbase::repo_scheme,
    domain   => $couchbase::repo_domain,
    port     => $couchbase::repo_port,
    user     => $couchbase::repo_user,
    pass     => $couchbase::repo_pass,
    path     => $couchbase::repo_path,
    resource => $couchbase::repo_resource,
  }

  exec {'couchbase_install_package':
    cwd     => '/tmp/',
    command => "${couchbase::params::installer} -i ${couchbase::repo_resource}",
    require => [Package[$couchbase::params::package], Common::Down_resource['couchbase_get_package']],
    unless  => '/usr/bin/test -d /opt/couchbase/'
  }
}

