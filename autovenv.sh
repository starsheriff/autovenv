#!/bin/bash

FN_AUTOVENV=.autovenv

find-autovenv() {
    local curdir=$(pwd)
    local path=
    
    while [ ! $path ] 
    do
        local parent="$(dirname "$curdir")"
        
        if [ -e "$curdir/$FN_AUTOVENV" ]
        then
            path=$curdir
        fi

        if [ "$curdir" == "$parent" ]
        then
            break
        fi

        curdir="$parent"

        
    done

    if [ "$path" ]
    then
        echo "$path"
    fi
}

autovenv() {
    if [ "$(find-autovenv)" ]
    then
        local venv=$(head -n 1 "$(find-autovenv)/$FN_AUTOVENV")
        source "$(find-autovenv)/$venv/bin/activate"
    else 
        if [ "$VIRTUAL_ENV" ]
        then
            deactivate
        fi 
    fi
}

cd() {
    builtin cd $@
    autovenv
}

autovenv
