class roles::vcs {

  package {'vcs-deps':
    name => ['subversion', 'git-core', 'mercurial', 'bzr', 'git-svn'],
    ensure => present,
  }

}
