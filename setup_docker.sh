#!/bin/bash
source "./configs/config.ini"
source "functions.sh"

cd $wwwPath

# nginx conf file exist
NGINX_CONFIG_FILE_ABSOLUTE_PATH="${wwwPath}/configs/nginx/default.conf"
if [ -f "$NGINX_CONFIG_FILE_ABSOLUTE_PATH" ]; then
    print_message "file ($NGINX_CONFIG_FILE_ABSOLUTE_PATH) exists. " 'green'
    print_message "Postawienie kontenerów dockera z pliku docker-compose.yml" 'yellow'
    sudo docker-compose up -d --build
    print_message "Sprawdzenie kontenerów (wszystkie kontenery powinne mieć status up) " 'yellow'
    sudo docker-compose ps
else
    print_message "file ($NGINX_CONFIG_FILE_ABSOLUTE_PATH) does not exist. " 'red'
fi
#sleep 20