# Aliases for file listing
[[ $OSTYPE != "darwin15" ]] && alias ls='ls --color'
[[ $OSTYPE == "darwin15" ]] && alias ls='ls -G'
alias ll='ls -lh'
alias la='ll -a'

# Mounting
alias mountklaus='sshfs klaus:/home/rniet $HOME/mounts/klaus -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=klaus'
alias mounteve='sshfs eve:/home/rniet $HOME/mounts/eve -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=eve'
alias mountlhcb='sshfs lhcb:/home/rniet $HOME/mounts/lhcb -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=lhcb'
alias mountphido='sshfs phido1:/home/rniet $HOME/mounts/phido -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=phido'
alias mountstorage03='sshfs phido1:/net/storage03/data/users/rniet $HOME/mounts/storage03 -F ~/.ssh/config -o auto_cache,reconnect,follow_symlinks,volname=storage03'

alias pyRootSetup='source /afs/cern.ch/sw/lcg/contrib/gcc/4.8/x86_64-slc6/setup.sh /afs/cern.ch/sw/lcg/contrib && cd /afs/cern.ch/sw/lcg/app/releases/ROOT/5.34.28/x86_64-slc6-gcc48-opt/root && source bin/thisroot.sh && export ROOTVERS=5.34.28 && export LD_LIBRARY_PATH=/afs/cern.ch/sw/lcg/external/Boost/1.55.0_python2.7/x86_64-slc6-gcc47-opt/lib:$LD_LIBRARY_PATH && cd - > /dev/null'

function mountAll(){
  mountklaus
  mounteve
  mountlhcb
  mountphido
  mountstorage03
}

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
export -f setROOT

function setSherpa()
{
  export SHERPASYS=/usr/local/sherpa/SHERPA-MC-2.2.0
  export PATH=$SHERPASYS/bin:$PATH
  export LD_LIBRARY_PATH=$SHERPASYS/lib:$LD_LIBRARY_PATH
}
export -f setSherpa
