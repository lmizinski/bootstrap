#!/bin/bash

source "./configs/config.ini"
source "functions.sh"

const_TextPlain='\e[0m' 
const_TextRed='\e[1;31m'
const_TextGreen='\e[1;32m'
const_TextYellow='\e[1;33m'

print_message "Sprawdzenie czy user posiada uprawnienia sudo " 'yellow'
sudo -l -U `whoami`

print_message "Sprawdzenie poprawności zainstalowania aplikacji: docker:  " 'yellow'
docker -v

print_message "Sprawdzenie poprawności zainstalowania aplikacji: docker-compose:  " 'yellow'
docker-compose -v

print_message "Sprawdzenie poprawności zainstalowania aplikacji: git:  " 'yellow'
git --version

print_message "  " 'yellow'
print_message "If above list contains [command not found] message - you should install software accordingly " 'red'
print_message "  " 'yellow'

# test whether config file was created
username=`whoami`
CONFIG_FILE_ABSOLUTE_PATH="/home/${username}/app/scripts/configs/config.ini"
CONFIG_FILE_RELATIVE_PATH=configs/config.ini
if [ -f "$CONFIG_FILE_ABSOLUTE_PATH" ] || [ -f "$CONFIG_FILE_RELATIVE_PATH" ]; then
	print_message "config file ($CONFIG_FILE_ABSOLUTE_PATH) exists. " 'green'
else
	print_message "config file ($CONFIG_FILE_ABSOLUTE_PATH) does not exist. Run bash copy_config.sh to fix it. Remember to update config." 'red'
fi

# test whether ssh file was generated
SSH_FILE_ABSOLUTE_PATH="/home/${username}/app/scripts/ssh/id_rsa.pub"
SSH_FILE_RELATIVE_PATH=ssh/id_rsa.pub
if [ -f "$SSH_FILE_ABSOLUTE_PATH" ] || [ -f "$SSH_FILE_RELATIVE_PATH" ]; then
	print_message "ssh file ($SSH_FILE_ABSOLUTE_PATH) exists. " 'green'
else
	print_message "ssh file ($SSH_FILE_ABSOLUTE_PATH) does not exist. Run bash ssh_generate.sh to fix it. Copy this file to your github repository. " 'red'
fi

# test whether ssh pem files were generated
SSH_FILE_ABSOLUTE_PATH="/home/${username}/app/scripts/ssh/public.pem"
SSH_FILE_RELATIVE_PATH=ssh/public.pem
if [ -f "$SSH_FILE_ABSOLUTE_PATH" ] || [ -f "$SSH_FILE_RELATIVE_PATH" ]; then
	print_message "ssh pem file ($SSH_FILE_ABSOLUTE_PATH) exists. " 'green'
else
	print_message "ssh pem file ($SSH_FILE_ABSOLUTE_PATH) does not exist. Run bash ssh_to_pem.sh to fix it. Copy this file to your github repository. " 'red'
fi

print_message "  " 'yellow'
print_message "  " 'yellow'
print_message "Press [enter] to exit  " 'yellow'
read clickAnythingToExit