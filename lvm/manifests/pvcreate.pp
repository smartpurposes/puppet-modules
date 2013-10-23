define lvm::pvcreate (

  $block_device = undef

) {

  require lvm

  if ! $block_device {
    fail('Physical_device need a Block Device')
  }

  exec {"pvcreate_${name}":
    command => "/sbin/pvcreate ${block_device}",
    unless  => "/sbin/pvdisplay ${block_device}"
  }
}
