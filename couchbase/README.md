#puppet-couchbase

Puppet manifest to install and configure couchbase

[![Build Status](https://secure.travis-ci.org/icalvete/puppet-couchbase.png)](http://travis-ci.org/icalvete/puppet-couchbase)

##Actions:

Install and configure [couchbase](http://www.couchbase.com/)
HA support

##Requires:

* [hiera](http://docs.puppetlabs.com/hiera/1/index.html)
* https://github.com/icalvete/puppet-common but really only need:
  + An http server and a package or use common::down_resource

##Authors:

Israel Calvete Talavera <icalvete@gmail.com>
