#!/bin/bash
set -o nounset
set -o errexit

if [ $# -eq 0 ]; then
	echo -e "usage: ./install.sh [-w (dt|nb)]"
	exit 0;
fi

while getopts "w:" opt; do
	case "$opt" in
		w) workstation="${OPTARG}"
			;;
	esac
done
shift $((OPTIND-1))


# directory of this script, i.e. root of the repository
source_dir=$(cd "$(dirname "$0")" && pwd)
overwrite=false

function install_symlink {
	[ $overwrite = true ] && rm -rf "$2";

	if [ -e "$2" ]; then
		echo "\"$2\" exists already, skipped.";
	else
		mkdir -p "${2%/*}";
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
install_symlink vim ~/.config/nvim
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

# === jumanji ===
install_symlink jumanji/jumanjirc ~/.config/jumanji/jumanjirc

# === gtk ===
install_symlink gtk/gtkrc-2.0 ~/.gtkrc-2.0
install_symlink gtk/settings.ini ~/.config/gtk-3.0/settings.ini

# === i3 ===
if [ "$workstation" == "nb" ]; then
	install_symlink i3/config-nb ~/.config/i3/config
	install_symlink i3status/config-nb ~/.config/i3status/config
else
	install_symlink i3/config ~/.config/i3/config
	install_symlink i3status/config ~/.config/i3status/config
fi

# === keyboard layout ===
$source_dir/bin/keyboard-layout neo2-numlvl3 2&> /dev/null
