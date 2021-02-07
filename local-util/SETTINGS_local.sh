#!/bin/bash
## AUTHOR: KURT ROJAS                    ##
## For more info on the author,          ##
## visit: https://kimrojas.github.io     ##

# - - - - - - - - - - - - - - - - - - - - - - #
#              SETTING PARAMETERS             #
# - - - - - - - - - - - - - - - - - - - - - - #

## SSH id location [typical: $HOME/.ssh/id_rsa]
c_SSHDIR=/home/krojas/.ssh/coare

## COARE username
c_USERNAME=kurt.rojas

## COARE hostname
c_HOSTNAME=saliksik.asti.dost.gov.ph

## Mount location of COARE directory
c_MNTLOC=$HOME/COARE-DIR





# - - - - - - - - - - - - - - - - - - - - - - #
#                DO NOT TOUCH                 #
# - - - - - - - - - - - - - - - - - - - - - - #

export c_SSHDIR
export c_USERNAME
export c_HOSTNAME
export c_MNTLOC



