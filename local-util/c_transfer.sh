#!/bin/bash
## AUTHOR: KURT ROJAS                    ##
## For more info on the author,          ##
## visit: https://kimrojas.github.io     ##

## COARE - TRANSFER UTILITY

c_transfer () {
  # Dependencies exist?
    pkg_exists rsync
    if [ "$c_exit" == 1 ]; then
        echo -e "\nExiting ... " 
        unset c_exit && return 0
    fi


  # ERROR CODE
  # Incomplete input
  ERROR_CODE_1="ERROR: Incomplete input. \nFor more information please use 'transfer help. Exiting ...'"

  # MAIN
  if [ "$1" == "to-srvr" ]; then
    if [ -z $2 ] || [ -z $3 ]; then echo -e $ERROR_CODE_1 && return 1;fi
    rsync -avrzP -e "ssh -i $SSHDIR" $2 $USERNAME@$SRVR:$3
  elif [ "$1" == "from-srvr" ]; then
    if [ -z $2 ] || [ -z $3 ]; then echo -e $ERROR_CODE_1 && return 1;fi
    rsync -avhzP -e "ssh -i $SSHDIR" $USERNAME@$SRVR:$2 $3
  else
    echo """\
C_TRANSFER ()

NAME
        c_transfer     - Transfer files between COARE and local directory

USAGE
        c_transfer [OPTION] SOURCE DESTINATION
        c_transfer [OPTION] /home/user.server/file /home/user.local/file

DESCRIPTION
        Facilitates the transfer between local and server directory of COARE with SSH key login 
        method.

        No need to input the username and server hostname, just needs the relative file path 
        (pwd output).

OPTIONS
        to-srvr         Initiates transfer protocol from local to server directory.

        from-srvr       Initiates transfer protocol from server to local directory.

        help            Prints this information.

AUTHOR
        Written by Kurt Irvin M. Rojas

SEE ALSO 
        Full documentation at: https://github.com/kimrojas/COARE-utility
    """
  fi

}

