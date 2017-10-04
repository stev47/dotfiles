# fixup if LC_ALL is set in /etc/bashrc
unset LC_ALL

# leave shell using ctrl+d
set +o ignoreeof

alias ls="ls -lh --color --time-style=\"+%Y-%m-%d %H:%m\""
alias rm="rm -I"
