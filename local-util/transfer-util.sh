#!/bin/bash
## AUTHOR: KURT ROJAS                                                 ##
## For more info on the author, visit: https://kimrojas.github.io     ##

## COARE - TRANSFER UTILITY

transfer () {
  
  # set default parameters here
  SSHDIR=/home/krojas/.ssh/coare.pub
  USERNAME=kurt.rojas
  SRVR=saliksik.asti.dost.gov.ph

  # ERROR CODE
  # Incomplete input
  ERROR_CODE_1="ERROR: Incomplete input. \nFor more information please use 'transfer help. Exiting ...'"

  #OPTIONS
  if [ "$1" == "to-srvr" ]; then
    if [ -z $2 ] || [ -z $3 ]; then echo -e $ERROR_CODE_1 && return 1;fi
    rsync -avrh -e "ssh -i $SSHDIR" $2 $USERNAME@$SRVR:$3
  elif [ "$1" == "from-srvr" ]; then
    if [ -z $2 ] || [ -z $3 ]; then echo -e $ERROR_CODE_1 && return 1;fi
    rsync -avrh -e "ssh -i $SSHDIR" $USERNAME@$SRVR:$3 $2
  else
    echo """
    HELP: transfer
        Facilitates the transfer between local and server directory of COARE
        with SSH key login method. 
        
        Requires 'rsync' package and a registered SSH key.
    
    USAGE:    transfer [to-srvr | from-srvr] [source-path] [destination-path]
    
    EXAMPLE:    transfer to-srvr /home/kurt_local/file /home/kurt_srvr/file

    OPTIONS:
    
        to-srvr
          Initiates transfer protocol from local to server directory.

        from-srvr
          Initiates transfer protocol from server to local directory.

    --
    CURRENT PARAMETERS:
        SSH key file = $SSHDIR 
        Username = $USERNAME
        Hostname = $SRVR
        
        ** Please edit the parameters if needed in 'transfer-util.sh'
    """
  fi

}

