#!/bin/bash
set -o nounset
set -o errexit

# directory of this script, i.e. root of the repository
source_dir=$(cd "$(dirname "$0")" && pwd)
overwrite=false

function install_symlink {
	[ $overwrite = true ] && rm -rf "$2";

	if [ -e "$2" ]; then
		echo "\"$2\" exists already, skipped.";
	else
		ln -s "$source_dir/$1" "$2";
	fi

	return 0;
}

# === misc config ===
for f in $source_dir/config/*; do
	install_symlink config/${f##*/} ~/.config/${f##*/}
done


# === Vim ===
install_symlink vim ~/.vim
install_symlink vim/vimrc ~/.vimrc
if [ ! -e $source_dir/vim/bundle/vundle ]; then
	git clone https://github.com/gmarik/vundle.git $source_dir/vim/bundle/vundle
	vim -c "BundleInstall" -c ":qa"
fi

# === Git ===
#before any "git config"
install_symlink git/gitconfig ~/.gitconfig
install_symlink git/gitignore ~/.gitignore
#git config --global core.excludesfile "~/.gitignore"

# === screen ===
install_symlink screen/screenrc ~/.screenrc

# === personal bin dir ===
install_symlink bin ~/bin

# === bashrc ===
install_symlink bash/bashrc ~/.bashrc

# === .profile ===
install_symlink profile ~/.profile

# === nodejs ===
install_symlink nodejs/npmrc ~/.npmrc

# === pacaur ===
install_symlink pacaur/config ~/.config/pacaur

# === keyboard layout ===
$source_dir/bin/keyboard-layout neo2-numlvl3 2&> /dev/null
