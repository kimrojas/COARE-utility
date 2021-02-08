#!/bin/bash
## AUTHOR: KURT ROJAS                    ##
## For more info on the author,          ##
## visit: https://kimrojas.github.io     ##

# Check Package 
 pkg_exists() {
    c_exit=0
    for pkg in $@
    do
        if ! [ -x "$(command -v $pkg)" ]; then 
            echo "ERROR: Package is not installed / loaded :   $pkg"
            sleep 0.2
            c_exit=1
        fi
    done
}

# Check Function
fn_exists() {
    c_exit=0
    for fn in $@ 
    do
        if ! [ `type -t $fn`"" == 'function' ]; then 
            echo "ERROR: Function is not installed / loaded :   $fn"
            c_exit=1
        ## -- For VERBOSITY --
        #else 
        #    echo "Function is loaded and exist |   $fn"
        fi
    done
}