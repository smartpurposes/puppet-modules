class couchbase::service {

  service{ 'couchbase-server':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }

}

