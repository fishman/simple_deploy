#!/bin/bash

# load version strings
. VERSION

# load all scripts
for i in library/S*sh; do . $i; done

# run this script as sudo
elevate_privileges

echo "do something"

exit 0
