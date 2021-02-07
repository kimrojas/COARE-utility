#!/bin/bash
## AUTHOR: KURT ROJAS                    ##
## For more info on the author,          ##
## visit: https://kimrojas.github.io     ##






DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="PWD"; fi

# - - - - - - - - - - - - - - - - - - - - - - - - - -
#               COARE - LOAD SETTINGS
# - - - - - - - - - - - - - - - - - - - - - - - - - -

. "$DIR/SETTINGS_local.sh"

echo """
--------------------------------
    COARE UTILITIES LOADED
--------------------------------

Detected settings .... 
  SSH id location = $c_SSHDIR
  COARE Username  = $c_USERNAME
  COARE Hostname  = $c_HOSTNAME
  COARE Mount     = $c_MNTLOC
"""

# - - - - - - - - - - - - - - - - - - - - - - - - - -
#            COARE - SETUP LOCAL UTILITIES
# ** comment out the utilities you don't want to use
# ** no interdepencency between utilities 
# - - - - - - - - - - - - - - - - - - - - - - - - - -

. "$DIR/transfer-util.sh"
