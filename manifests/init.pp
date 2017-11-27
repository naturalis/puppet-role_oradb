# == Class: role_oradb
#
# Full description of class role_oradb here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { role_oradb:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name rudi.broekhuizen@naturalis.nl
#
# === Copyright
#
# Copyright 2017 Rudi Broekhuizen
#
class role_oradb (
  $installdb_hash = undef,
  $net_hash       = undef,
  $database_hash  = undef,
) {

  class {"role_oradb::config":
  }

  class {"role_oradb::installdb":
    installdb_hash => $installdb_hash,
    require        => Class['role_oradb::config'],
  }

  class {"role_oradb::net":
    net_hash => $net_hash,
    require  => Class['role_oradb::installdb'],
  }

  class {"role_oradb::database":
    database_hash => $database_hash,
    require       => Class['role_oradb::net'],
  }
}
