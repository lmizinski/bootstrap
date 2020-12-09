#!/bin/bash

const_TextPlain='\e[0m' 
const_TextRed='\e[1;31m'
const_TextGreen='\e[1;32m'
const_TextYellow='\e[1;33m'

printf '%b' "${const_TextYellow}" "Sprawdzenie czy user posiada uprawnienia sudo " "${const_TextPlain}" '\n'
sudo -l -U `whoami`

printf '%b' "${const_TextYellow}" "Sprawdzenie poprawności zainstalowania aplikacji: docker:  " "${const_TextPlain}" '\n'
docker -v

printf '%b' "${const_TextYellow}" "Sprawdzenie poprawności zainstalowania aplikacji: docker-compose:  " "${const_TextPlain}" '\n'
docker-compose -v

printf '%b' "${const_TextYellow}" "Sprawdzenie poprawności zainstalowania aplikacji: git:  " "${const_TextPlain}" '\n'
git --version

printf '%b' '\n'
printf '%b' "${const_TextRed}" "If above list contains [command not found] message - you should install software accordingly  " "${const_TextPlain}" '\n'
printf '%b' '\n'

# test whether config file was created
username=`whoami`
CONFIG_FILE_ABSOLUTE_PATH="/home/${username}/app/scripts/configs/config.ini"
CONFIG_FILE_RELATIVE_PATH=configs/config.ini
if [ -f "$CONFIG_FILE_ABSOLUTE_PATH" ] || [ -f "$CONFIG_FILE_RELATIVE_PATH" ]; then
	printf '%b' "${const_TextGreen}" "config file ($CONFIG_FILE_ABSOLUTE_PATH) exists. " "${const_TextPlain}" '\n'
else
	printf '%b' "${const_TextRed}" "config file ($CONFIG_FILE_ABSOLUTE_PATH) does not exist. Run bash copy_config.sh to fix it. Remember to update config." "${const_TextPlain}" '\n'
fi

# test whether ssh file was generated
SSH_FILE_ABSOLUTE_PATH="/home/${username}/app/scripts/ssh/id_rsa.pub"
SSH_FILE_RELATIVE_PATH=configs/config.ini
if [ -f "$SSH_FILE_ABSOLUTE_PATH" ] || [ -f "$SSH_FILE_RELATIVE_PATH" ]; then
	printf '%b' "${const_TextGreen}" "ssh file ($SSH_FILE_ABSOLUTE_PATH) exists. " "${const_TextPlain}" '\n'
else
	printf '%b' "${const_TextRed}" "ssh file ($SSH_FILE_ABSOLUTE_PATH) does not exist. Run bash generate_ssh.sh to fix it. Copy this file to github repository. " "${const_TextPlain}" '\n'
fi


printf '%b' '\n'
printf '%b' '\n'
printf '%b' "${const_TextYellow}" "Press [enter] to exit " "${const_TextPlain}" '\n'
read clickAnythingToExit