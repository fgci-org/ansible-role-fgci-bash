#!/bin/bash
if [ "$USER" == "root" ]; then
        # Do not generate an ssh key for root in /root/ on every compute node
        return 0
fi
#only do this if the home directory is writeable (i.e. not for grid users)
if [ -w $HOME ] ; then
 if [ ! -e $HOME/.ssh ] ; then
  #If there's no ssh directory, create it
  mkdir $HOME/.ssh
 
  if [ $? -ne 0 ] ; then
   echo "Could not create ssh keys. Please contact your local admin" >&2
   exit 1
  fi

  chmod 700 $HOME/.ssh
 fi

 if [ ! -f $HOME/.ssh/id_ed25519 ] ; then
  #Create the user SSH keys if they're missing
  echo "This seems to be your first login"
  echo "SSH keys will be created for you so you can ssh in the cluster"
  ssh-keygen -t ed25519  -f $HOME/.ssh/id_ed25519 -N ""

  if [ $? -ne 0 ] ; then
   echo "Could not create ssh keys. Please contact your local admin" >&2
   exit 1
  fi

  cat $HOME/.ssh/id_ed25519.pub >> $HOME/.ssh/authorized_keys
  chmod 644 $HOME/.ssh/authorized_keys
  echo "So! That didn't take too long, did it?"
 fi
fi

