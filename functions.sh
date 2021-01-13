#!/bin/bash

NC='\e[0m' 
RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'

#Success = green
#Info = blue
#Warning = yellow
#Danger = red

function print_message {
    if [ $2 == 'red' ]
    then
        echo -e "${RED}$1 ${NC}"
    elif [ $2 == 'green' ]
    then
        echo -e "${GREEN}$1 ${NC}"
    elif [ $2 == 'yellow' ]
    then
        echo -e "${YELLOW}$1 ${NC}"
    else
        echo -e "${NC} $1 ${NC}"
    fi
}