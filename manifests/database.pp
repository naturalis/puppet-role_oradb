## == Class: role_oradb:database.pp
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
# action        =  createDatabase|deleteDatabase
# databaseType  = MULTIPURPOSE|DATA_WAREHOUSING|OLTP
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class role_oradb::database (
            $oracleBase              = '/oracle',
            $oracleHome              = '/oracle/product/11.2/db',
            $user                    = 'oracle',
            $group                   = 'dba',
            $downloadDir             = '/install',
            $action                  = 'create',
            $dbName                  = 'test',
            $dbDomain                = 'oracle.com',
            $sysPassword             = 'Welcome01',
            $systemPassword          = 'Welcome01',
            $dataFileDestination     = "/oracle/oradata",
            $recoveryAreaDestination = "/oracle/flash_recovery_area",
            $characterSet            = "AL32UTF8",
            $nationalCharacterSet    = "UTF8",
            $initParams              = "open_cursors=1000,processes=600,job_queue_processes=4,compatible=11.2.0.0.0",
            $sampleSchema            = 'TRUE',
            $memoryPercentage        = "40",
            $memoryTotal             = "800",
            $databaseType            = "MULTIPURPOSE",
#            $require                 = "Oradb::Listener['start listener']",
){

   oradb::database{ 'testDb':
                   oracleBase              => $oracleBase,
                   oracleHome              => $oracleHome,
                   user                    => $user,
                   group                   => $group,
                   downloadDir             => $downloadDir,
                   action                  => $action,
                   dbName                  => $dbName,
                   dbDomain                => $dbDomain,
                   sysPassword             => $sysPassword,
                   systemPassword          => $systemPassword,
                   dataFileDestination     => $dataFileDestination,
                   recoveryAreaDestination => $recoveryAreaDestination,
                   characterSet            => $characterSet,
                   nationalCharacterSet    => $nationalCharacterSet,
                   initParams              => $initParams,
                   sampleSchema            => $sampleSchema,
                   memoryPercentage        => $memoryPercentage,
                   memoryTotal             => $memoryTotal,
                   databaseType            => $databaseType,
#                   require                 => Class[$require],
    }
}
