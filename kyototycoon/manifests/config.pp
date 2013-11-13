class kyototycoon::config {

  file {$kyototycoon::params::database_path:
    ensure => directory
  }

  file {"${kyototycoon::params::database_path}/${kyototycoon::params::ktbin}":
    ensure  => directory,
    require => File[$kyototycoon::params::database_path]
  }

  file {$kyototycoon::params::log_path:
    ensure => directory
  }

  file {'kyototycoon_init':
      ensure  => present,
      path    => "/etc/init.d/${kyototycoon::params::service}",
      content => template("${module_name}/${kyototycoon::params::service}.init.erb"),
      mode    => '0775',
      require => File[$kyototycoon::params::database_path, $kyototycoon::params::log_path]
  }
}
