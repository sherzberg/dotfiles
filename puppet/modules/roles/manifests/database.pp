class roles::database {

  package {'mysql-deps':
    name => ['mysql-client', 'mysql-workbench'],
    ensure => present,
  }

}
