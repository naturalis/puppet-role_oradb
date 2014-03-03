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
# Copyright 2014 Your name here, unless otherwise noted.
#
class role_oradb (
  $installdb_hash = {'112010_Linux-x86-64' => { version                => '11.2.0.1',
                                                file                   => 'linux.x64_11gR2_database',
                                                databaseType           => 'SE',
                                                oracleBase             => '/oracle',
                                                oracleHome             => '/oracle/product/11.2/db',
                                                createUser             => true,
                                                user                   => 'oracle',
                                                userBaseDir            => '/home',
                                                group                  => 'dba',
                                                downloadDir            => '/install',
                                                zipExtract             => false,
                                                puppetDownloadMntPoint => '/zipfiles',
                                                remoteFile             => false,
                                              },
                    },
  $net_hash       = {'listener' => { oracleHome   => '/oracle/product/11.2/db',
                                     version      => '11.2',
                                     user         => 'oracle',
                                     group        => 'dba',
                                     downloadDir  => '/install',
                                    },
                     },
  $database_hash  = {'orcl' => { oracleBase              => '/oracle',
                                 oracleHome              => '/oracle/product/11.2/db',
                                 user                    => 'oracle',
                                 group                   => 'dba',
                                 downloadDir             => '/install',
                                 action                  => 'create',
                                 dbName                  => 'orcl',
                                 dbDomain                => 'nnm.local',
                                 sysPassword             => 'Welcome01',
                                 systemPassword          => 'Welcome01',
                                 dataFileDestination     => "/oracle/oradata",
                                 recoveryAreaDestination => "/oracle/flash_recovery_area",
                                 characterSet            => "AL32UTF8",
                                 nationalCharacterSet    => "UTF8",
                                 initParams              => "open_cursors=1000,processes=600,job_queue_processes=4,compatible=11.2.0.0.0",
                                 sampleSchema            => 'TRUE',
                                 memoryPercentage        => "40",
                                 memoryTotal             => "800",
                                 databaseType            => "MULTIPURPOSE",
                                },
                     },
) {

  host { $::fqdn:
    ensure       => 'present',
    host_aliases => [$::hostname],
    ip           => $::ipaddress,
    target       => '/etc/hosts',
  }

  class {"role_oradb::installdb":
    installdb_hash => $installdb_hash,
  }

  class {"role_oradb::net":
    net_hash => $net_hash,
    require  => [Host[$::fqdn],Class['role_oradb::installdb']],
  }

  class {"role_oradb::database":
    database_hash => $database_hash,
    require       => Class['role_oradb::net'],
  }
}