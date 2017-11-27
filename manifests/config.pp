# == Class: role_oradb::config
#
class role_oradb::config {

  host { $::fqdn:
    ensure       => 'present',
    host_aliases => [$::hostname, 'localhost'],
    ip           => $::ipaddress,
    target       => '/etc/hosts',
  }
  
  $packages = [ 'unzip', 'ksh' ]
  package { $packages: }
  
  $all_groups = ['oinstall','dba' ,'oper']

  group { $all_groups :
    ensure      => present,
  }

  user { 'oracle' :
    ensure      => present,
    uid         => 500,
    gid         => 'oinstall',
    groups      => ['oinstall','dba','oper'],
    shell       => '/bin/bash',
    password    => '$1$DSJ51vh6$4XzzwyIOk6Bi/54kglGk3.',
    home        => "/home/oracle",
    comment     => "This user oracle was created by Puppet",
    require     => Group[$all_groups],
    managehome  => true,
  }
}
