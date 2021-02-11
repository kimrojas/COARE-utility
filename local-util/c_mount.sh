#!/bin/bash
## AUTHOR: KURT ROJAS                    ##
## For more info on the author,          ##
## visit: https://kimrojas.github.io     ##

c_mount () {
    # Dependencies exist?
    pkg_exists sshfs fusermount
    if [ "$c_exit" == 1 ]; then
        echo -e "\nExiting ... " 
        unset c_exit && return 0
    fi

    # MAIN 
    if [ "$1" == "init" ]; then
        
        # Directory exist?
        if [ -d "$c_MNTLOC" ]; then
            echo "Mount location: $c_MNTLOC"
        else
            echo "Mounting location does not exist." 
            echo "Creating directory: $c_MNTLOC ..."
            mkdir -p $c_MNTLOC
        fi
        
        # Mount
        echo "Mounting ..."
        sshfs -C $c_USERNAME@$c_HOSTNAME:/home/$c_USERNAME $c_MNTLOC -o reconnect,IdentityFile=$c_SSHDIR,follow_symlinks 
        echo "Mounted successful: $c_MNTLOC"
        echo ""
        echo "- - - - - - - - - - - - - - - - - - - - - - -"
        echo "         IMPORTANT! Use with caution         "
        echo "- - - - - - - - - - - - - - - - - - - - - - -"
        echo "Intentional or random disconnects may result "
        echo "to freeze when using 'ls' command. To solve, "
        echo "use: 'c_mount unmount'                       "

    elif [ "$1" == "unmount" ]; then
        
        # Unmount
        echo "Unmounting ..."
        fusermount -zu $c_MNTLOC
        echo "Unmounted successfully: $c_MNTLOC"

    else

        # Info
        echo """\
C_MOUNT ()

NAME
        c_mount     - Mounts the COARE directory

USAGE
        c_mount [OPTION]

DESCRIPTION
        Mounts the COARE DIRECTORY to the specified local directory via ssh connection 
        (ssh key login). 

        Intentional or random disconnects may result to freeze when using 'ls' command. To solve, 
        use: 'c_mount unmount'

        Current mount location: $c_MNTLOC

OPTIONS
        init            Mounts the COARE directory to designated mount location.

        unmount         Unmounts the COARE directory from mount location.

        help            Prints this information.
AUTHOR
        Written by Kurt Irvin M. Rojas

SEE ALSO 
        Full documentation at: https://github.com/kimrojas/COARE-utility
        """

    fi
}

