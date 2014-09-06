#!/bin/sh

# node binaries
[ -d ~/.nodejs/modules/bin ] && export PATH=~/.nodejs/modules/bin:${PATH}
# personal binary path
[ -d ~/bin ] && export PATH=~/bin:${PATH}

export EDITOR="vim"
export MANPAGER="/bin/sh -c \"col -pb | vim -Rc 'set ft=man nonu nomod nolist' -\""

export MAKEFLAGS='-j 5'

alias view='vim -R'
alias ls="ls -alh --color --time-style=\"+%Y-%m-%d %H:%m\""
alias o='xdg-open'

# alias steam-wine="wine ~/.wine/drive_c/Program\ Files/Steam/Steam.exe -no-dwrite"

