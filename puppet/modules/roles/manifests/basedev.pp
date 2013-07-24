class roles::basedev {

  package {'dev-deps':
    name => ['curl', 'unzip', 'cowsay', 'ncdu', 'unar', 'htop'],
    ensure => present,
  }

}
