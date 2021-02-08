#!/bin/bash
## AUTHOR: KURT ROJAS                    ##
## For more info on the author,          ##
## visit: https://kimrojas.github.io     ##

c_mount () {
    # Dependencies exist?
    pkg_exists sshfs fusermount gcc
    if [ "$exit_val" == "exit" ]; then
        echo -e "\nExiting ... " 
        exit_val=0 && return 0
    fi

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
        echo """
C_MOUNT ()

NAME
        c_mount     - Mounts the COARE directory

USAGE
        c_mount [OPTION]

DESCRIPTION
        Mounts the COARE DIRECTORY to the specified local directory
        via ssh connection (ssh key login). 

        Current mount location: $c_MNTLOC

OPTIONS
        init            Mounts the COARE directory to designated mount location.
        unmount         Unmounts the COARE directory from mount location.
        help            Prints this information.
        """

    fi
}

