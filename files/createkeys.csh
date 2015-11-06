#!/bin/tcsh
#only do this if the homedirectory is writeable, i.e. not for grid users
if ( -w $HOME ) then
 if ( ! -e $HOME/.ssh ) then
  #If there's no ssh directory, create it
  mkdir $HOME/.ssh
 
  if ( $status != 0 ) then
   echo "Could not create ssh keys. Please contact your local admin" >&2
   exit 1
  endif
 
  chmod 700 $HOME/.ssh
 endif
 
 if ( ! -f $HOME/.ssh/id_rsa ) then
  #Create the user SSH keys if they're missing
  echo "This seems to be your first login"
  echo "SSH keys will be created for you so you can ssh in the cluster"
  ssh-keygen -t rsa  -f $HOME/.ssh/id_rsa -N ""
 
  if ( $status != 0 ) then
   echo "Could not create ssh keys. Please contact your local admin" >&2
   exit 1
  endif
 
  cat $HOME/.ssh/id_rsa.pub >> $HOME/.ssh/authorized_keys
  chmod 644 $HOME/.ssh/authorized_keys
  echo "So! That didn't take too long, did it?"
 endif
endif
