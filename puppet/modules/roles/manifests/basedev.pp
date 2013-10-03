class roles::basedev {

  package {'dev-deps':
    name => ['curl', 'unrar', 'unzip', 'cowsay', 'ncdu', 'unar', 'htop', 'ranger'],
    ensure => present,
  }

}
