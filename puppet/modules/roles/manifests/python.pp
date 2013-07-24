class roles::python {

  package {'python-deps':
    name => ['python-dev', 'python-pip', 'virtualenvwrapper'],
    ensure => present,
  }

}
