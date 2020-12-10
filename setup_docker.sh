#!/bin/bash
source "./configs/config.ini"

const_TextPlain='\e[0m' 
const_TextRed='\e[1;31m'
const_TextGreen='\e[1;32m'
const_TextYellow='\e[1;33m'

cd $wwwPath

# test whether ssh file was generated
NGINX_CONFIG_FILE_ABSOLUTE_PATH="/home/lmi/code/www/configs/nginx/default.conf"
if [ -f "$NGINX_CONFIG_FILE_ABSOLUTE_PATH" ]; then
	printf '%b' "${const_TextGreen}" "file ($NGINX_CONFIG_FILE_ABSOLUTE_PATH) exists. " "${const_TextPlain}" '\n'
    printf '%b' "${const_TextYellow}" "Postawienie kontenerów dockera z pliku docker-compose.yml" "${const_TextPlain}" '\n'
    sudo docker-compose up -d --build
    printf '%b' "${const_TextYellow}" "Sprawdzenie kontenerów (wszystkie kontenery powinne mieć status up) " "${const_TextPlain}" '\n'
    sudo docker-compose ps
else
	printf '%b' "${const_TextRed}" "file ($NGINX_CONFIG_FILE_ABSOLUTE_PATH) does not exist. " "${const_TextPlain}" '\n'
fi
#sleep 20