#kyototycoon

Puppet manifest to install and configure kyototycoon.

[![Build Status](https://secure.travis-ci.org/icalvete/puppet-kyototycoon.png)](http://travis-ci.org/icalvete/puppet-kyototycoon-brbd)

See [kyototycoon](http://fallabs.com/kyototycoon/) and [Fundamental Specifications of Kyoto Tycoon](http://fallabs.com/kyototycoon/spex.html)

##Actions:

* Only works in Ubuntu 13.10
* Install and configure lonely server
* Install and configure "Dual Master" cluster
  + **Note that updating both of the servers at the same time might cause inconsistency of their databases. That is, you should use one master as a "active master" and the other as a "standby master".**
* Install and configure a "Pluggable Server" with memcached
* Install and configure an slave
* Install and configure any combination of above

##Example:

A "Dual Master" cluster with memcached plugin

```
node 'ubuntu1301.smartpurposes.net' inherits test_defaults {
  include roles::puppet_agent

  class {'kyototycoon':
    hamaster  => true,
    mhost     => 'ubuntu1302.smartpurposes.net',
    memcached => true
  }
}

node 'ubuntu1302.smartpurposes.net' inherits test_defaults {
  include roles::puppet_agent

  class {'kyototycoon':
    hamaster  => true,
    mhost     => 'ubuntu1301.smartpurposes.net',
    sid       => '1',
    memcached => true
  }
}
```

An extra slave


```
node 'ubuntu1303.smartpurposes.net' inherits test_defaults {
  include roles::puppet_agent

  class {'kyototycoon':
    slave     => true,
    mhost     => 'ubuntu1301.smartpurposes.net',
    sid       => '2',
    memcached => true
  }
}
```


##Authors:

Israel Calvete Talavera <icalvete@gmail.com>
