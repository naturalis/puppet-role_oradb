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
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class role_oradb::installdb (
  $version                = '11.2.0.1',
  $file                   = 'linux.x64_11gR2_database',
  $databaseType           = 'SE',
  $oracleBase             = '/oracle',
  $oracleHome             = '/oracle/product/11.2/db',
  $createUser             = 'true',
  $user                   = 'oracle',
  $userBaseDir            = '/home',
  $group                  = 'dba',
  $downloadDir            = '/install',
  $zipExtract             = true,
){
    oradb::installdb{ '112010_Linux-x86-64':
            version      => $version,
            file         => $file,
            databaseType => $databaseType,
            oracleBase   => $oracleBase,
            oracleHome   => $oracleHome,
            createUser   => $createUser,
            user         => $user,
            userBaseDir  => $userBaseDir,
            group        => $group,
            downloadDir  => $downloadDir,
            zipExtract   => $zipExtract,
    }
}
