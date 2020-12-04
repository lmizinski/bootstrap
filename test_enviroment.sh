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

# test whether config file was created

FILE=configs/config.ini
if [ -f "$FILE" ]; then
	printf '%b' "${const_TextGreen}" "config file ($FILE) exists. " "${const_TextPlain}" '\n'
else
	printf '%b' "${const_TextRed}" "config file ($FILE) does not exist. " "${const_TextPlain}" '\n'
fi


printf '%b' '\n'
printf '%b' "${const_TextRed}" "If above list contains [command not found] message - you should install software accordingly  " "${const_TextPlain}" '\n'
printf '%b' '\n'
printf '%b' "${const_TextYellow}" "Press [enter] to exit " "${const_TextPlain}" '\n'
read clickAnythingToExit