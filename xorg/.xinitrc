[[ -f ~/scripts/setupmonitors.sh ]] && . ~/scripts/setupmonitors.sh
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
[[ -f /usr/bin/xscreensaver ]] && /usr/bin/xscreensaver -no-splash &
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

source /etc/X11/xinit/xinitrc.d/30-dbus
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

exec awesome 
