[ -f ~/.profile ] && source ~/.profile
[ -f ~/.bashrc ] && source ~/.bashrc

if [ "$(tty)" = "/dev/tty1" ]; then
  exec dbus-launch --sh-syntax --exit-with-session sway
fi
