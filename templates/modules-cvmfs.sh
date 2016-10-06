#!/bin/bash
#load modules.sh before, otherwise it will not set the default modulepath
if [ -f /etc/profile.d/modules.sh ] ; then
 . /etc/profile.d/modules.sh
fi
#export MODULEPATH=$MODULEPATH:/cvmfs/fgi.csc.fi/modules/el7/all
export MODULEPATH=$MODULEPATH:{{ bash_modules_path }}

