class roles::jvm {

  package {'default-jdk':
    ensure => present,
  }

  class {'gradle':
    version => '1.6',
    timeout => 400,
  }

  class {'groovy':
    version => "2.1.4",
    timeout => 400,
  }

  package {'jvm-build-deps':
    name => ['ant', 'maven'],
    ensure => present,
  }

}
