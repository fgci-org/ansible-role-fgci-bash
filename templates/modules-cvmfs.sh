#!/bin/bash
#load modules.sh before, otherwise it will not set the default modulepath
if [ -f /etc/profile.d/modules.sh ] ; then
 . /etc/profile.d/modules.sh
fi
#export MODULEPATH=$MODULEPATH:/cvmfs/fgi.csc.fi/modules/el7/all
#export MODULEPATH=$MODULEPATH:{{ bash_modules_path }}

# Idempotently add each of the paths to the module paths.  It is
# critical to blindly append to MODULEPATH if re-loaded, because: 1)
# lmod will complain that the path has change, 2) subshells will
# re-read this file, including slurm scripts, and 3) save/restore of
# modules doesn't work.

# function to idempotently append anything to any PATH-like variable
PATHADD2 () { if eval [ x"\"\$$1\"" = x'' ] ; then eval "export $1=$2" ; else eval "echo \"\$$1\"" | grep "\(^\|:\)$2\(:\|$\)" 2>&1 > /dev/null || eval "export $1=\$$1:$2" ; fi }

# this is a bashism (-a):
#IFS=: read -ra _paths__fgciload <<< {{ bash_modules_path }}
#for _path__fgciload in "${paths[@]}"; do
#    PATHADD2 MODULEPATH "$path"
#done

_modules__fgci="{{ bash_modules_path }}"
while [ _modules__fgci ] ; do
    _mod__fgci=${_modules__fgci%%:*}
    PATHADD2 MODULEPATH "$_mod__fgci"
    [ "$_modules__fgci" = "$_mod__fgci" ] && break || _modules__fgci=${_modules__fgci#*:}
done

unset _path__fgciload _paths__fgciload
unset -f PATHADD2
