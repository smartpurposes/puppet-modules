class kyototycoon::install {

  package {$kyototycoon::params::package:
    ensure => present
  }
}

