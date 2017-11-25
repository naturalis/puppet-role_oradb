# == Class: role_oradb::net
#
class role_oradb::net(
  $net_hash,
  ) {
    create_resources('oradb::net', $net_hash)
}
