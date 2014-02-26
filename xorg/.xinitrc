[[ -f ~/scripts/setupmonitors.sh ]] && . ~/scripts/setupmonitors.sh
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
exec awesome 
