#!/bin/tcsh
#First source the modules.csh otherwise the default paths won't be set
if ( -f "/etc/profile.d/modules.csh" ) then
 source /etc/profile.d/modules.csh
endif

#setenv MODULEPATH "${MODULEPATH}:/cvmfs/fgi.csc.fi/modules/el7/all"
#setenv MODULEPATH "${MODULEPATH}:{{ bash_modules_path }}"

set _modpaths__fgci = `echo {{ bash_modules_path }} | sed 's/:/ /g'`

# For reasoning of this, see modules-cvmfs.sh

# Someone who is a csh expert: feel free to rewrite this.

if ( ${?_modpaths__fgci} ) then
    foreach _modpath__fgci ($_modpaths__fgci:q)
	if ( ! ${?MODULEPATH} ) then
	    setenv MODULEPATH $_modpath__fgci:q
	else if ( "$MODULEPATH:q" == '' ) then
	    setenv MODULEPATH $_modpath__fgci:q
	else if (  "$MODULEPATH:q" =~ "${_modpath__fgci:q}" \
		|| "$MODULEPATH:q" =~ "*:${_modpath__fgci:q}" \
		|| "$MODULEPATH:q" =~ "${_modpath__fgci:q}:*" \
		|| "$MODULEPATH:q" =~ "*:${_modpath__fgci:q}:*" ) then
	else
	    setenv MODULEPATH "${MODULEPATH:q}:${_modpath__fgci:q}"
	endif
    end
endif

unset _modpath__fgci _modpaths__fgci
