# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

# fixup if LC_ALL is set in /etc/bashrc
unset LC_ALL

# leave shell using ctrl+d
set +o ignoreeof

[ $TERM = "xterm-termite" ] && [ ! -f /usr/share/terminfo/x/xterm-termite ] && export TERM="xterm-256color"

# aliases
unalias rm cp mv 2> /dev/null
alias ls="ls -lh --color --time-style=\"+%y-%m-%d %H:%m\""
alias vim="nvim"
alias t="task"
alias grep="grep --color"

# bash_completion throws weird errors if we don't undo `allexport`
set +o allexport
[ -f /etc/bash_completion ] && source /etc/bash_completion
