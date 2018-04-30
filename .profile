# language preferences
unset LANGUAGE
unset LC_ALL
LC_MESSAGES="en_US.UTF-8"

# ramdisk cache dir
[ -d /dev/shm ] && mkdir -p /dev/shm/${LOGNAME}/cache
[ -e ~/.cache ] || ln -s /dev/shm/${LOGNAME}/cache ~/.cache

# local harddisk dir if ~/ is on afs mount
if [ $(df -P -T ~/ | tail -1 | awk '{print $2}') == 'afs' ]; then
  [ -d /usr/local/home -a -w /usr/local/home ] && mkdir -p /usr/local/home/${LOGNAME}
  [ -L ~/local -o -f ~/local ] || ln -s /usr/local/home/${LOGNAME} ~/local
fi

# personal binaries
PATH="~/bin:$PATH"

# make $HOME to ~ shortening work for symlinked home dirs
HOME="$(realpath $HOME)"

export TERMINAL="sakura"
export EDITOR="nvim"

# gpg-agent
if ! [ -f ~/.gnupg/gpg-agent.env ] || ! gpg-agent 2> /dev/null; then
  killall gpg-agent 2> /dev/null
  gpg-agent --daemon \
            --write-env-file ~/.gnupg/gpg-agent.env > /dev/null
  source ~/.gnupg/gpg-agent.env
  export GPG_AGENT_INFO
  export GPG_TTY=$(tty)
fi
