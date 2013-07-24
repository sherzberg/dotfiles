export EDITOR=vim

# Enable vi mode
set -o vi

# History
export HISTSIZE=1000
export HISTCONTROL=ignoredups:ignorespace
shopt -s histappend

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# fix spelling mistakes!
shopt -s cdspell

source ~/dotfiles/bash/colors/gentoo-bash

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
	. /etc/bash_completion
fi

# Colors
for colorfile in ~/dotfiles/bash/colors/*; do
	. $colorfile
done

# Aliases
shopt -s expand_aliases
for aliasfile in ~/dotfiles/bash/aliases/*; do
	source $aliasfile
done

# Exports
for i in ~/dotfiles/bash/exports/*; do
	. $i
done

# Functions
for funcfile in ~/dotfiles/bash/functions/*; do
	. $funcfile
done

# Load profiles from /etc/profile.d
if test -d /etc/profile.d/; then
	for profile in /etc/profile.d/*.sh; do
		test -r "$profile && . $profile"
	done
	unset profile
fi

proml
