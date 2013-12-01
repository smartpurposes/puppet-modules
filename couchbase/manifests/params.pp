class couchbase::params {

  case $::operatingsystem {
    /^(CentOS|RedHat)$/: {
      $package = 'openssl098e'
    }
    default: {
      fail ("${::operatingsystem} not supported.")
    }
  }
}
