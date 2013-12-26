#!/bin/bash

# directory of this script, i.e. root of the repository
DIR=$(cd "$(dirname "$0")" && pwd)

# Vim
if [ ! -e ~/.vim ]; then
	echo "Installing vim dotfiles."
	ln -s $DIR/vim           ~/.vim
	ln -s $DIR/vim/vimrc     ~/.vimrc
	git clone https://github.com/gmarik/vundle.git $DIR/vim/bundle/vundle
	vim -c "BundleInstall" -c ":qa"
else
	echo "Found '~/.vim', not doing anything."
fi

# Git
if [ ! -e ~/.gitconfig ]; then
	echo "Installing git dotfiles."
	# before any "git config"
	ln -s $DIR/git/gitconfig ~/.gitconfig

	ln -s $DIR/git/gitignore ~/.gitignore
	git config --global core.excludesfile ~/.gitignore
else
	echo "Found '~/.gitconfig', not doing anything."
fi

