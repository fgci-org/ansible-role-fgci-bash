# Generic env vars for module command which may or may not make one's
# life easier

# This should be default?
export LMOD_PAGER=/bin/less

# After upgrade to Lmod 8.2.7 need to set this, otherwise ml avail and
# ml spider fail.
export LMOD_FAST_TCL_INTERP=no
