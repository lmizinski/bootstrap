#!/bin/bash
source "./configs/config.ini"
source "functions.sh"

print_message "Restarting services:  nginx" 'yellow'
(cd $wwwPath; sudo docker-compose stop nginx)
(cd $wwwPath; sudo docker-compose start nginx) 
(cd $wwwPath; sudo docker exec -ti nginx service nginx start)

print_message "Restarting services:  php" 'yellow'
(cd $wwwPath; sudo docker-compose stop php)
(cd $wwwPath; sudo docker-compose start php)
(cd $wwwPath; sudo docker exec -d php php-fpm)

print_message "Restarting services:  postgres" 'yellow'
(cd $wwwPath; sudo docker-compose stop postgres)
(cd $wwwPath; sudo docker-compose start postgres)

print_message "Code updated & services restarted" 'green'