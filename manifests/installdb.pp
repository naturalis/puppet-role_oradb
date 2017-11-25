# == Class: role_oradb::installdb
#
class role_oradb::installdb(
  $installdb_hash,
  ) {
    create_resources('oradb::installdb', $installdb_hash)
}
