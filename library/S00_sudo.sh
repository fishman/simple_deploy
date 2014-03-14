#!/bin/bash

function elevate_privileges {
if [ -z "$SUDO_COMMAND" ]
then
    mntusr=$(id -u) grpusr=$(id -g) sudo $0 $*
    exit 0
fi
}
