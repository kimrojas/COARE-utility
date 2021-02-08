#!/bin/bash
## AUTHOR: KURT ROJAS                    ##
## For more info on the author,          ##
## visit: https://kimrojas.github.io     ##

c_mount () {
    # Dependencies exist?
    pkg_exists sshfs fusermount gcc
    if [ "$exit_val" == "exit" ]; then echo -e "\nExiting ... " && return 0; fi

    # Directory exist?
    if [ -d "$c_MNTLOC" ]; then
        echo "Mount location: $c_MNTLOC"
    else
        echo "Mounting location does not exist." 
        echo "Creating directory: $c_MNTLOC . . ."
        mkdir -p $c_MNTLOC
    fi

    # MAIN 
    if [ "$1" == "init" ]; then
        echo "Mounting ..."
        sshfs -C $c_USERNAME@$c_HOSTNAME:/home/$c_USERNAME $c_MNTLOC -o IdentityFile=$c_SSHDIR -o reconnect
        echo "Mounted successfully: $c_MNTLOC"
        echo 'If `ls` commands hangs, use `c_mount unmount` '
    elif [ "$1" == "unmount" ]; then
        echo "Unmounting ..."
        fusermount -zu $c_MNTLOC
        echo "Unmounted successfully: $c_MNTLOC"
    else
        echo '''    
HELP: c_mount
    Mounts the COARE directory to a local directory. 

    Requires `sshfs` package and registered SSH key. 

USAGE: c_mount [ init | unmount ]

OPTIONS:

    init
        Mounts the COARE directory to designated mount location.
    
    unmount 
        Unmounts the COARE directory from mount location.
        '''

    fi
}

