Intro
=====

My dotfiles were mostly borrowed from:

    https://github.com/shawncplus/dotfiles
    https://github.com/nelstrom/dotfiles
    https://github.com/haridas/Dotfiles
    https://github.com/mbrochh/vim-as-a-python-ide

Installation
============

Be sure to backup anything like ~/.bashrc or ~/.vimrc as this will delete them.

```bash
$ cd ~
$ git clone git@github.com:sherzberg/dotfiles.git
$ cd dotfiles
$ ./install
```

I now use Vundle to install vim plugins so use this target. This command will fail when trying to load colors but just hit ENTER.

Update Vim Plugins
==================

```bash
$ vim +BundleUpdate +qall
```
