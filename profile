#!/bin/sh

# node binaries
[ -d ~/.nodejs/modules/bin ] && export PATH=$PATH:~/.nodejs/modules/bin
# ruby gems
ruby_version=`ruby --version | grep -Po "\d+\.\d+\.\d+"`
[ -d ~/.gem/ruby/${ruby_version}/bin ] && export PATH=$PATH:~/.gem/ruby/${ruby_version}/bin
# personal binary path
[ -d ~/bin ] && export PATH=~/bin:${PATH}

export EDITOR="vim"
export MANPAGER="/bin/sh -c \"col -pb | vim -Rc 'set ft=man nonu nomod nolist' -\""

export MAKEFLAGS='-j 5'

alias view='vim -R'
alias ls="ls -lh --color --time-style=\"+%Y-%m-%d %H:%m\""
alias o='xdg-open'

# alias steam-wine="wine ~/.wine/drive_c/Program\ Files/Steam/Steam.exe -no-dwrite"

