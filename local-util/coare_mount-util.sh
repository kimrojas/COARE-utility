#!/bin/bash
## AUTHOR: KURT ROJAS                    ##
## For more info on the author,          ##
## visit: https://kimrojas.github.io     ##

coare_mount () {
    sshfs $c_USERNAME@$c_HOSTNAME:/home/$c_USERNAME $c_MNTLOC -o IdentityFile=$c_SSHDIR
}

#sshfs kurt.rojas@saliksik.asti.dost.gov.ph:/home/kurt.rojas $HOME/COARE-DIR -o IdentityFile=$HOME/.ssh/coare
