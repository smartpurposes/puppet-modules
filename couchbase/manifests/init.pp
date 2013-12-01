class couchbase (

  $repo_scheme   = $couchbase::params::repo_scheme,
  $repo_domain   = $couchbase::params::repo_domain,
  $repo_port     = $couchbase::params::repo_port,
  $repo_user     = $couchbase::params::repo_user,
  $repo_pass     = $couchbase::params::repo_pass,
  $repo_path     = $couchbase::params::repo_path,
  $repo_resource = $couchbase::params::package,

) inherits couchbase::params {

  anchor {'couchbase::begin':
    before => Class['couchbase::install']
  }
  class {'couchbase::install':
    require => Anchor['couchbase::begin']
  }
  class {'couchbase::config':
    require => Class['couchbase::install']
  }
  class {'couchbase::service':
    require => Class['couchbase::config']
  }
  anchor {'couchbase::end':
    require => Class['couchbase::service']
  }
}
