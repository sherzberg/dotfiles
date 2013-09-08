class roles::virtualization {

  #class {'virtualbox': }
  #class {'vagrant': }

  include docker
  docker::image { 'base': }
  docker::image { 'ubuntu': }

  package {'libvirt-deps':
    name => ['cpu-checker', 'qemu-kvm', 'libvirt-bin', 'virtinst'],
    ensure => present,
  }

}
