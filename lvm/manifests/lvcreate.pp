define lvm::lvcreate (

  $logical_volume = $name,
  $size           = undef,
  $volume_group   = undef

) {

  require lvm

  if ! $size {
    fail('Logical Volume need size.')
  }

  if ! $volume_group {
    fail('Logical Volume need a volume_group.')
  }

  exec {"lvcreate_${logical_volume}":
    command => "/sbin/lvcreate --name ${logical_volume} --size ${size} ${volume_group}",
    unless  => "/sbin/lvdisplay /dev/${volume_group}/${logical_volume}"
  }
}
