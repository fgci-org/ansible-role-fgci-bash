# Generic env vars for module command which may or may not make one's
# life easier

# This should be default?
export LMOD_PAGER=/bin/less

# After upgrade to Lmod 8.2.7 need to set this, otherwise ml avail and
# ml spider fail.
export LMOD_FAST_TCL_INTERP=no

{% if lmod_admin_file is defined %}
# define custom path for adminfile. Used to e.g. deprecate modules
export LMOD_ADMIN_FILE={{ lmod_admin_file }}
{% endif %}

{% if lmod_modulerc_file is defined %}
# define custom path for modulerc file. Used to e.g. hide modules
export LMOD_MODULERCFILE={{ lmod_modulerc_file }}
{% endif %}
