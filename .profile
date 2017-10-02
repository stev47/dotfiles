# leave shell using ctrl+d
set +o ignoreeof

# language preferences
unset LANGUAGE
unset LC_ALL
export LC_MESSAGES="en_US.UTF-8"

# fast cache
[ -d /dev/shm ] && mkdir -p /dev/shm/hilbsn/cache

[ "$BASH" ] && [ -f ~/.bashrc ] && source ~/.bashrc
