#!/bin/bash

# directory of this script, i.e. root of the repository
DIR=$(cd "$(dirname "$0")" && pwd)

# Vim
if [ ! -e ~/.vim ]; then
	echo "Installing vim dotfiles."
	rm -rf ~/.vim ~/.vimrc
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
	rm -rf ~/.gitconfig ~/.gitignore
	# before any "git config"
	ln -s $DIR/git/gitconfig ~/.gitconfig

	ln -s $DIR/git/gitignore ~/.gitignore
	git config --global core.excludesfile "~/.gitignore"
else
	echo "Found '~/.gitconfig', not doing anything."
fi

# screen
if [ ! -e ~/.screenrc ]; then
	echo "Installing screen dotfiles."
	rm -rf ~/.screenrc
	ln -s $DIR/screen/screenrc ~/.screenrc
else
	echo "Found '~/.screenrc', not doing anything."
fi

# personal bin files
if [ ! -d ~/bin ]; then
	echo "Installing binary dir."
	ln -s $DIR/bin ~/bin
else
	echo "Found '~/bin', not doing anything."
fi

# bashrc
if [ ! -e ~/.bashrc ]; then
	echo "Installing bashrc."
	ln -s $DIR/bash/bashrc ~/.bashrc
else
	echo "Found '~/.bashrc', not doing anything."
fi
