alias lhcbSetup="source /lhcbsoft/LHCbSoftwareSetup.sh"

alias mountklaus='sshfs klaus:/home/rniet $HOME/mounts/klaus -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=klaus'
alias mountklaus%e5='sshfs klaus%e5:/home/rniet $HOME/mounts/klaus -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=klaus'
alias mounteve='sshfs eve:/home/rniet $HOME/mounts/eve -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=eve'
alias mounteve%e5='sshfs eve%e5:/home/rniet $HOME/mounts/eve -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=eve'
alias mountbam='sshfs bam:/home/rniet $HOME/mounts/bam -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=bam'
alias mountbam%e5='sshfs bam%e5:/home/rniet $HOME/mounts/bam -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=bam'
alias mountlhcb='sshfs lhcb:/home/rniet $HOME/mounts/lhcb -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=lhcb'
alias mountlhcb%e5='sshfs lhcb%e5:/home/rniet $HOME/mounts/lhcb -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=lhcb'
alias mountphido='sshfs phido1:/home/rniet $HOME/mounts/phido -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=phido'
alias mountphido%e5='sshfs phido1%e5:/home/rniet $HOME/mounts/phido -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=phido'
alias mountstorage03='sshfs eve:/net/storage03/data/users/rniet $HOME/mounts/storage03 -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=storage03'
alias mountstorage03%e5='sshfs eve%e5:/net/storage03/data%e5/users/rniet $HOME/mounts/storage03 -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=storage03'

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

function setSherpa()
{
  export SHERPASYS=/usr/local/sherpa/SHERPA-MC-2.2.0
  export PATH=$SHERPASYS/bin:$PATH
  export LD_LIBRARY_PATH=$SHERPASYS/lib:$LD_LIBRARY_PATH
}

function pyRootSetup()
{
  source /afs/cern.ch/sw/lcg/contrib/gcc/4.8/x86_64-slc6/setup.sh /afs/cern.ch/sw/lcg/contrib 
  cd /afs/cern.ch/sw/lcg/app/releases/ROOT/5.34.28/x86_64-slc6-gcc48-opt/root 
  source bin/thisroot.sh 
  export ROOTVERS=5.34.28 
  export LD_LIBRARY_PATH=/afs/cern.ch/sw/lcg/external/Boost/1.55.0_python2.7/x86_64-slc6-gcc47-opt/lib:$LD_LIBRARY_PATH 
}

it2prof() { echo -e "\033]50;SetProfile=$1\a" }
it2proftmux() { echo -e "\033Ptmux;\033\033]50;SetProfile=$1\007\033\\" }

function dark()
{
  BASE16_SHELL="$HOME/.config/base16-shell/base16-tomorrow.dark.sh"
  [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL && echo "switching to $BASE16_SHELL"
  if [ -n "$TMUX" ]; then
    it2proftmux TomorrowDark
  else
    it2prof TomorrowDark
  fi
  export THEME_BACKGROUND="dark"
}

function light()
{
  BASE16_SHELL="$HOME/.config/base16-shell/base16-solarized.light.sh"
  [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL && echo "switching to $BASE16_SHELL"
  if [ -n "$TMUX" ]; then
    it2proftmux SolarizedLight
  else
    it2prof SolarizedLight
  fi
  export THEME_BACKGROUND="light"
}


if [ -n "$BASH_VERSION" ]; then
  export -f setROOT
  export -f pyRootSetup
  export -f setSherpa
  export -f dark
  export -f light
fi
