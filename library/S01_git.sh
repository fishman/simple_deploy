#!/bin/sh

# {{{ update from git
function git_checkout {
if [ -d $1 ] ; then
    cd $1 && git checkout master && git reset --hard origin/master && git pull origin
    debug_print "The local files are updated."
else
    git clone git@github.com:protonet/${1}.git $1
fi
[[ -n $2 ]] && git checkout origin/$2
git submodule update --init >& /dev/null
git reset --hard  >& /dev/null
}
# }}}

# vim: set foldmethod=marker:ts=4:et:sws=4:

