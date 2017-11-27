# == Class: role_oradb::installdb
#
class role_oradb::installdb(
  $installdb_hash,
  ) {
    create_resources('oradb::installdb', $installdb_hash)
   
  # java.lang.UnsatisfiedLinkError: /oracle/product/11.2/db/lib/libnjni11.so: libclntsh.so.11.1: cannot open shared object file: No such file or directory
  file { '/oracle/product/11.2/db/lib/libclntsh.so.11.1':
    ensure => link,
    target => '/oracle/product/11.2/db/inventory/Scripts/ext/lib/libclntsh.so.11.1',
    owner => 'oracle',
    group => 'oinstall'
  }

}
