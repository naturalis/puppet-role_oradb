puppet-role_oradb
===================

Puppet module to install Oracle database server
```bash
scp -P 2222 p13390677_112040_Linux-x86-64_1of7.zip localhost:/tmp
```

Parameters
-------------
All parameters are read from defaults in init.pp and can be overwritten by hiera or The foreman.

Classes
-------------
- role_oradb
- role_oradb::installdb
- role_oradb::net
- role_oradb::database

Dependencies
-------------
biemond/biemond-oradb

Examples
-------------
Hiera yaml file, if you want to install multiple database installations, databases, listeners. Example for multiple listeners:

```
role_oradb::net_hash:
  listener-01:
    oracleHome: '/oracle/product/11.2/db'
    version: '11.2'
    user: 'oracle'
    group: 'dba'
    downloadDir: '/install'
  listener-02:
    oracleHome: '/oracle/product/11.2/db'
    version: '11.2'
    user: 'oracle'
    group: 'dba'
    downloadDir: '/install'
```

Limitations
-------------
This module has been built on and tested against Puppet 3 and higher.

The module has been tested on:
- CentOS 6.5
- Oracle Linux 6.5

Authors
-------------
Author Name rudi.broekhuizen@naturalis.nl

