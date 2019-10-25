[![Build Status](https://travis-ci.org/CSCfi/ansible-role-fgci-bash.svg)](https://travis-ci.org/CSCfi/ansible-role-fgci-bash)
# ansible-role-fgci-bash
Installs FGCI specific bash login scripts as well as module scripts

By default it copies in:
 - all \*sh that are in files/
 - all \*lua that are in files/

Does things like:
 - generate passwordless ssh keys for users
 - changes $MANPATH
 - installs a lmod_log.sh to log lmod module usage
 - changes modules path

# Variables

see defaults/main.yml

# License

MIT
