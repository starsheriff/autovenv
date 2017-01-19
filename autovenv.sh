#!/bin/bash

FN_AUTOVENV=.autovenv

# recursively find a .autovenv file
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

# handle logic to activate/deactivate virtualenvs
autovenv() {
    local venv_dir="$(find-autovenv)"
    if [ "$venv_dir" ]
    then
        local venv_name=$(head -n 1 "$venv_dir/$FN_AUTOVENV")
        #echo "activating $venv_name"
        source "$venv_dir/$venv_name/bin/activate"
    else 
        if [ "$VIRTUAL_ENV" ] 
        then
            #echo "deactivating $venv_name"
            deactivate
        fi 
    fi
}

# wrap builtin cd command
cd() {
    echo $@
    builtin cd "$@"
    autovenv
}

# also run autovenv in a freshly created shell
autovenv
