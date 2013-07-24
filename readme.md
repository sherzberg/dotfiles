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

I now use Vundle to install vim plugins so use this target

```bash
$ make plugin-update
```

Be sure to backup anything like ~/.bashrc or ~/.vimrc as this will delete them.

```bash
$ ./install
```

Update Vim Plugins
==================

```bash
$ make plugin-update
```
