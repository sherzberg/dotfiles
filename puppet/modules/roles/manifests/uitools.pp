class roles::uitools {

  class {'idea::ultimate':
    version => '12.1.4',
  }

  package {'tools':
    name => ['pcmanfm', 'virt-manager', 'qemu-system'],
    ensure => present,
  }

  package {'wm':
    name => ['i3', 'i3-wm', 'i3lock' ,'i3status'],
    ensure => present,
  }

  package {'graphics':
    name => ['gimp', 'gimp-resynthesizer', 'gimp-ufraw', 'feh'],
    ensure => present,
  }

}
