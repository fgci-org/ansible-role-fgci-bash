# skip everything for non-interactive shells
if (! $?prompt) exit

# Set LS_COLORS per
# https://news.sherlock.stanford.edu/posts/when-setting-an-environment-variable-gives-you-a-40-x-speedup
#setenv LS_COLORS 'ex=00:su=00:sg=00:ca=00:'
setenv LS_COLORS `echo "$LS_COLORS" |awk -F: 'BEGIN{ORS=":"} \
{ for (i=1; i < NF; i++) {\
    if ($i ~ /^ex/) {\
        print "ex=00"\
    } else if ($i ~ /^su=/) {\
        print "su=00"\
    } else if ($i ~ /^sg=/) {\
        print "sg=00"\
    } else if ($i ~ /^ca=/) {\
        print "ca=00"\
    } else {\
        print $i\
    }\
 }\
} END{printf "\n"}'`
