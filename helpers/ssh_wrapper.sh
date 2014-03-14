#!/bin/sh

if [ $# -lt 2 ]
then
    echo "Usage: `basename $0` {hostip} {scriptname}"
    echo "{scriptname} is one of the scripts in here to be executed remotely"
    exit $E_BADARGS
fi
# package VERSION library and script
# in case the script has any dependencies in library
tar cjf bootstrap.tar.bz2 VERSION library $2
scp bootstrap.tar.bz2 protonet@$1:/tmp
ssh -A -t myuser@$1 /bin/bash -c "
  mkdir -p /tmp/runscript
  cd /tmp/runscript
  . ~/.profile
  tar xjvf /tmp/bootstrap.tar.bz2
  bash /tmp/runscript/$2 $3
  rm -rf /tmp/runscript
  rm /tmp/bootstrap.tar.bz2"
