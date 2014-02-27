[[ -f ~/scripts/setupmonitors.sh ]] && . ~/scripts/setupmonitors.sh
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
[[ -f /usr/bin/xscreensaver ]] && /usr/bin/xscreensaver -no-splash &
exec awesome 
