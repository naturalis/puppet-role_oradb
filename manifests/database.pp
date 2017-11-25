# == Class: role_oradb::database
#
class role_oradb::database(
  $database_hash,
  ) {
    create_resources('oradb::database', $database_hash)
}
