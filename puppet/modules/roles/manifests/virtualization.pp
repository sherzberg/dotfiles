class roles::virtualization {

  class {'virtualbox': }
  #class {'vagrant': }

  package {'libvirt-deps':
    name => ['cpu-checker', 'qemu-kvm', 'libvirt-bin', 'virtinst']
    ensure => present,
  }

}
