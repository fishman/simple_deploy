#!/bin/sh

function sed_inplace {
    if [[ $(uname) == Darwin ]] && [[ -z $EPREFIX ]]; then
        sed -i "" "$@"
    else
        sed -i "$@"
    fi
}
