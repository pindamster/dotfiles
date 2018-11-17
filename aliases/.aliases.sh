alias mountbam='sshfs bam:/home/rniet $HOME/mounts/bam -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=bam'
alias mountbam%e5='sshfs bam%e5:/home/rniet $HOME/mounts/bam -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=bam'

function setROOT()
{
  export ROOTSYS=/afs/cern.ch/sw/lcg/app/releases/ROOT/5.34.21/x86_64-slc6-gcc48-opt/root
  export PATH=$ROOTSYS/bin:$PATH
  export LD_LIBRARY_PATH=$ROOTSYS/lib:/usr/local/lib:$LD_LIBRARY_PATH
  export BOOST_ROOT=/cvmfs/lhcb.cern.ch/lib/lcg/releases/LCG_71/Boost/1.55.0_python2.7/x86_64-slc6-gcc48-opt
  export BOOSTROOT=/cvmfs/lhcb.cern.ch/lib/lcg/releases/LCG_71/Boost/1.55.0_python2.7/x86_64-slc6-gcc48-opt
  export LD_LIBRARY_PATH=$BOOST_ROOT/lib:$LD_LIBRARY_PATH
  export ROOTVERS=5.34.21
  export PYTHONPATH=$ROOTSYS/lib:$PYTHONPATH
}

function py3root6Setup()
{
  cd /opt/rh/miniconda/envs/py3root6
  source /opt/rh/miniconda/scripts/py3root6.sh
  cd -

  export DOOFITSYS=/doosoft/doofit/ROOT_v6.06.00/
  export DOOCORESYS=/doosoft/doocore/ROOT_v6.06.00/
  export DOOSELECTIONSYS=/doosoft/dooselection/ROOT_v6.04.00/

  export PATH=$PATH:$DOOCORESYS/bin:$DOOFITSYS/bin:$DOOSELECTIONSYS/bin
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$DOOCORESYS/lib:$DOOFITSYS/lib:$DOOSELECTIONSYS/lib
}

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
  export -f setROOT
  export -f dark
  export -f light
fi

