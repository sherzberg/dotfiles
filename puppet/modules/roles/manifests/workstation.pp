class roles::workstation {

  package{'cowsay':
    ensure => present,
  }

  class {'android':
    user => 'sherzberg',
    group => 'sherzberg',
    installdir => '/opt/android',
  }
  ->
  exec {'/bin/chown sherzberg:sherzberg -R /opt/android':
  }

  include roles::basedev
  include roles::vcs
  include roles::python
  include roles::jvm
  include roles::virtualization
  include roles::uitools

}
