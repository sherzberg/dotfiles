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
$ wget -O - http://git.io/O3VIhg | sudo sh
```

I now use Vundle to install vim plugins so use this target. This command will fail when trying to load colors but just hit ENTER.

Update Vim Plugins
==================

```bash
$ vim +BundleUpdate +qall
```
