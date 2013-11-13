class kyototycoon::service {

  service{ 'ktserver':
    ensure     => running,
    enable     => true,
    hasstatus  => false,
    hasrestart => true,
  }

}

