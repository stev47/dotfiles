# leave shell using ctrl+d
set +o ignoreeof

# language preferences
unset LANGUAGE
unset LC_ALL
LC_MESSAGES="en_US.UTF-8"

# ramdisk cache dir
[ -d /dev/shm ] && mkdir -p /dev/shm/${LOGNAME}/cache
[ -e ~/.cache ] || ln -s /dev/shm/${LOGNAME}/cache ~/.cache

# local harddisk dir if ~/ is on afs mount
if [ $(df -P -T ~/ | tail -1 | awk '{print $2}') == 'afs' ]; then
  [ -d /usr/local/home ] && mkdir -p /usr/local/home/${LOGNAME}
  [ -e ~/local ] || ln -s /usr/local/home/${LOGNAME} ~/local
fi

# personal binaries
PATH="~/bin:$PATH"

# make $HOME to ~ shortening work for symlinked home dirs
HOME="$(realpath $HOME)"

[ "$BASH" ] && [ -f ~/.bashrc ] && source ~/.bashrc
