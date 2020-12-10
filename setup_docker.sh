#!/bin/bash
source "./configs/config.ini"

const_TextPlain='\e[0m'  
const_TextYellow='\e[1;33m' 

cd $wwwPath

# test whether ssh file was generated
NGINX_CONFIG_FILE_ABSOLUTE_PATH="/home/lmi/code/www/configs/nginx/default.conf"
if [ -f "$NGINX_CONFIG_FILE_ABSOLUTE_PATH" ]; then
	printf '%b' "${const_TextGreen}" "ssh file ($NGINX_CONFIG_FILE_ABSOLUTE_PATH) exists. " "${const_TextPlain}" '\n'
else
	printf '%b' "${const_TextRed}" "ssh file ($NGINX_CONFIG_FILE_ABSOLUTE_PATH) does not exist. Run bash generate_ssh.sh to fix it. Copy this file to your github repository. " "${const_TextPlain}" '\n'
fi

printf '%b' "${const_TextYellow}" "Postawienie kontenerów dockera z pliku docker-compose.yml" "${const_TextPlain}" '\n'
sudo docker-compose up -d --build
printf '%b' "${const_TextYellow}" "Sprawdzenie kontenerów (wszystkie kontenery powinne mieć status up) " "${const_TextPlain}" '\n'
sudo docker-compose ps
#sleep 20