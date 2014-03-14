#!/bin/sh

cflag=false;
hflag=false;

while getopts "c:h:" arg; do
    case "$arg" in
        # default to an incremental backup
        # and an update of the timestamp
        c) cflag=true;command="$OPTARG"; ;;
        h) hflag=true;host="$OPTARG"; ;;
        :) echo "Missing option argument for -$OPTARG" >&2; exit 1;;
        ?) usage; exit;;
    esac
done
if ! $cflag
then
    echo "-c must specify a command" >&2
    usage
    exit 1
fi

function check_host_flag {
    if ! $hflag
    then
        echo "-c and -h must be specified" >&2
        usage
        exit 1
    fi
}
# }}}
