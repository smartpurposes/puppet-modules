define lvm::vgcreate (

    $volume_group    = $name,
    $physical_device = undef

) {

  require lvm

  if ! $physical_device {
    fail('Volume Group need a physical_device.')
  }

  exec {"vgcreate_${volume_group}":
    command => "/sbin/vgcreate ${volume_group} $physical_device",
    unless  => "/sbin/vgdisplay ${volume_group}"
  }
}
