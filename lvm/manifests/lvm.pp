class lvm () inherits lvm::params {

  anchor {'lvm::begin':
    before => Class['lvm::install']
  }
  class {'lvm::install':
    require => Anchor['lvm::begin']
  }
  anchor {'lvm::end':
    require => Class['lvm::install']
  }
}
