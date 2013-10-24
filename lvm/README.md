#puppet-lvm

Puppet manifest to create lvm physical devices, volume groups and logical volume.

[![Build Status](https://secure.travis-ci.org/icalvete/puppet-lvm.png)](http://travis-ci.org/icalvete/puppet-lvm)

##Actions:

 - Create a physical devices
 - Create a volume group
 - Create a logica volume


##Example:

    lvm::pvcreate{'sda2':
      block_device => '/dev/sda2'
    }

    lvm::vgcreate{'/dev/vg_0':
      physical_device => '/dev/sda2',
      require         => Lvm::Pvcreate['sda2']
    }

    lvm::lvcreate{'lv_0':
      size => '50G',
      volume_group => 'vg_0';
      require      => Lvm::Vgcreate['/dev/vg_0']
    }

##Authors:

Israel Calvete Talavera <icalvete@gmail.com>
