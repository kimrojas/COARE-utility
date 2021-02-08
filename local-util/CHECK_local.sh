#!/bin/bash
## AUTHOR: KURT ROJAS                    ##
## For more info on the author,          ##
## visit: https://kimrojas.github.io     ##

# Check Package 
 pkg_exists() {
    exit_val="continue"
    for pkg in $@
    do
        if ! [ -x "$(command -v $pkg)" ]; then 
            echo "ERROR: Package is not installed / loaded :   $pkg"
            exit_val="exit"
        fi
    done
}

# Check Function
fn_exists() {
    exit_val=""
    for fn in $@ 
    do
        if ! [ `type -t $fn`"" == 'function' ]; then 
            echo "ERROR: Function is not installed / loaded :   $fn"
            exit_val="exit"
        ## -- For VERBOSITY --
        #else 
        #    echo "Function is loaded and exist |   $fn"
        fi
    done
}