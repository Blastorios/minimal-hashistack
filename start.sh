#!/bin/bash

# SET Values
DIRS=(echo */);
ARGS=$1;

# Helper functions
call_vagrant () {
    for dir in "${DIRS[@]:1}"; do
        cd $dir
        vagrant up $1
        cd -
    done;
};

if [ $ARGS != "" ]; then
    # DEBUG: display commands.
    echo "Running with $ARGS";
    call_vagrant $ARGS;
fi;
