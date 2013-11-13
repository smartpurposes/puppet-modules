class kyototycoon (

  $hamaster  = false,
  $slave     = false,
  $port      = $kyototycoon::params::port,
  $sid       = $kyototycoon::params::sid,
  $mhost     = undef,
  $mport     = $kyototycoon::params::port,
  $memcached = false,
  $plex_port = $kyototycoon::params::plex_port

) inherits kyototycoon::params {

  if $hamaster or $slave {
    if ! $mhost {
      fail('mhost parameter can\'t be empty with hamaster/slave = true')
    }

    notify {'Remember: ¡¡¡ sid parameter must be unique !!!':}
  }

  anchor {'kyototycoon::begin':
    before => Class['kyototycoon::install']
  }
  class {'kyototycoon::install':
    require => Anchor['kyototycoon::begin']
  }
  class {'kyototycoon::config':
    require => Class['kyototycoon::install'],
    notify  => Class['kyototycoon::service']
  }
  class {'kyototycoon::service':
    require => Class['kyototycoon::config']
  }
  anchor {'kyototycoon::end':
    require => Class['kyototycoon::service']
  }
}
