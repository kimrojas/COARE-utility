#!/bin/bash
## AUTHOR: KURT ROJAS                                                 ##
## For more info on the author, visit: https://kimrojas.github.io     ##

## COARE - SETUP LOCAL UTILITIES
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="PWD"; fi

. "$DIR/transfer-util.sh"
