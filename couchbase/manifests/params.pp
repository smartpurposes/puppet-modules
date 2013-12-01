class couchbase::params {

  case $::operatingsystem {
    /^(Debian|Ubuntu)$/: {
      $package   = 'libssl0.9.8'
      $installer = '/usr/bin/dpkg'
    }
    /^(CentOS|RedHat)$/: {
      $package   = 'openssl098e'
      $installer = '/bin/rpm'
    }
    default: {
      fail ("${::operatingsystem} not supported.")
    }
  }
}
