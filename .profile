# leave shell using ctrl+d
set +o ignoreeof

# language preferences
unset LANGUAGE
unset LC_ALL
LC_MESSAGES="en_US.UTF-8"

# fast cache
[ -d /dev/shm ] && mkdir -p /dev/shm/${LOGNAME}/cache
[ -f ~/.cache ] || ln -s /dev/shm/${LOGNAME}/cache ~/.cache

# personal binaries
PATH="~/bin:$PATH"

# make $HOME to ~ shortening work for symlinked home dirs
HOME="$(realpath $HOME)"

[ "$BASH" ] && [ -f ~/.bashrc ] && source ~/.bashrc
