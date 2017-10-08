# fixup if LC_ALL is set in /etc/bashrc
unset LC_ALL

# leave shell using ctrl+d
set +o ignoreeof

# aliases
unalias rm cp mv 2> /dev/null
alias ls="ls -lh --color --time-style=\"+%y-%m-%d %H:%m\""
