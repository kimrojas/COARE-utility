#!/bin/bash
## AUTHOR: KURT ROJAS                    ##
## For more info on the author,          ##
## visit: https://kimrojas.github.io     ##

c_login () {
    # Dependencies exists?
    pkg_exists ssh
    if [ "$c_exit" == 1 ]; then
        echo -e "\nExiting ... " 
        unset c_exit && return 0
    fi

    # MAIN
    if ! [ "$1" == "help" ]; then
        srvr_name=$c_USERNAME@$c_HOSTNAME
        ssh -i $c_SSHDIR -o ServerAliveInterval=60 $srvr_name -XC
    else
        echo """\
C_LOGIN ()

NAME
        c_login         - login to COARE

USAGE
        c_login 
        c_login help 

DESCRIPTION
        Simplifies the login procedure to COARE cluster via (passwordless) ssh.

        Requires a registered SSH key.

OPTIONS
        (none)          Initiates login protocol.

        help            Prints this information.

AUTHOR
        Written by Kurt Irvin M. Rojas

SEE ALSO 
        Full documentation at: https://github.com/kimrojas/COARE-utility
        """
    fi


}