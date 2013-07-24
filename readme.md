Intro
=====

My dotfiles were mostly borrowed from:

    https://github.com/shawncplus/dotfiles
    https://github.com/nelstrom/dotfiles
    https://github.com/haridas/Dotfiles
    https://github.com/mbrochh/vim-as-a-python-ide

Installation
============

```bash
$ git clone git://github.com/whelmingbytes/dotfiles.git
```

Where possible, Vim plugins are installed as git submodules. Check these out by
running the commands:

```bash
$ make vim-init
```

Install
=======

Be sure to backup anything like ~/.bashrc or ~/.vimrc as this will delete them.

```bash
$ make install
```

Update Vim Plugins
==================

$ make vim-update
