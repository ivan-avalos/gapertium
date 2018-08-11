#!/bin/bash
# Gapertium - CLI Front-end for Apertium
# Copyright (C) 2018  Iván Ávalos <ivan.avalos.diaz@hotmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# Color
RED='\033[0;31m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
ORANGE='\033[1;33m'
NC='\033[0m'

# Welcome message

printf """${PURPLE} _____                       _   _                 
|  __ \                     | | (_)                
| |  \/ __ _ _ __   ___ _ __| |_ _ _   _ _ __ ___  
| | __ / _\` | '_ \ / _ \ '__| __| | | | | '_ \` _ \ 
| |_\ \ (_| | |_) |  __/ |  | |_| | |_| | | | | | |
 \____/\__,_| .__/ \___|_|   \__|_|\__,_|_| |_| |_|
            | |                                    
            |_|                                    
CLI Front-end for Apertium
by Ivan Avalos <ivan.avalos.diaz@hotmail.com>

${NC}"""

# Press enter
printf "${GREEN}Press Enter key: ${NC}"
ENTER=''
read ENTER
echo ''

INFINITE=0
while [ $INFINITE -lt 1 ]; do

    # Translate direction
    printf "${ORANGE}%% Direction:${NC}\n"
    select opt in `apertium -l | grep -v 'bytecode'`; do
        DIRECTION=$opt
	break;
    done;
    printf "${GREEN} ${DIRECTION} selected.${NC}\n"

    echo ''

    # Input to translate
    printf "${ORANGE}%% Text:${NC}\n"
    read TEXT

    echo ''

    # Translation output
    printf "${ORANGE}%% Translation:${NC}\n"
    echo "\"$TEXT\"" | apertium $DIRECTION

    echo ''

    # Quit confirmation
    CONTINUE=''
    while [ "$CONTINUE" != 'y' -o "$CONTINUE" != 'n' ]; do
	  printf "${GREEN}Continue? [y/n] ${NC}"
	  read CONTINUE
	  if [ "$CONTINUE" = "y" ]; then
	      echo '--------------------------------------------------'
	      break
	  elif [ "$CONTINUE" = "n" ]; then
	      exit
	  fi
    done
done
