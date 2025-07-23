alias ls='ls --color'
alias ll='ls -l'
alias la='ll -a'
# alias vi='nvim'
# alias vim='nvim'

function it2prof() {
  echo -e "\033]50;SetProfile=$1\a"
}

function it2proftmux() {
  echo -e "\033Ptmux;\033\033]50;SetProfile=$1\007\033\\"
}

function dark()
{
  BASE16_SHELL="$HOME/.config/base16-shell/base16-tomorrow.dark.sh"
  [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
  if [ -n "$TMUX" ]; then
    it2proftmux TomorrowDark
    tmux setenv -g THEME_BACKGROUND dark
    tmux source ~/.tmux_tomorrowdark.conf > /dev/null
  else
    it2prof TomorrowDark
  fi
  export THEME_BACKGROUND="dark"
}

function light()
{
  BASE16_SHELL="$HOME/.config/base16-shell/base16-solarized.light.sh"
  [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
  if [ -n "$TMUX" ]; then
    it2proftmux SolarizedLight
    tmux setenv -g THEME_BACKGROUND light
    tmux source ~/.tmux_solarizedlight_nargoth.conf > /dev/null
  else
    it2prof SolarizedLight
  fi
  export THEME_BACKGROUND="light"
}

if [ -n "$BASH_VERSION" ]; then
  export -f dark
  export -f light
fi

