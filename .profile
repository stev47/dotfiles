# leave shell using ctrl+d
set +o ignoreeof

# language preferences
unset LANGUAGE
unset LC_ALL
export LC_MESSAGES="en_US.UTF-8"


[ "$BASH" ] && [ -f ~/.bashrc ] && source ~/.bashrc
