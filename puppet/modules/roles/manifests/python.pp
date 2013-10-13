class roles::python {

  package {'python-deps':
    name    => ['python-dev', 'python-pip'],
    ensure  => present,
  }

  package {'python-pip-deps':
    name     => ['pip', 'virtualenvwrapper', 'wheel', 'autoenv'],
    provider => 'pip',
    ensure   => present,
    require  => Package['python-deps'],
  }

}
