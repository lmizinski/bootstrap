#!/bin/bash
source "./configs/config.ini"

cd $wwwPath
sshCommand='ssh-add ../../scripts/ssh/id_rsa; git reset --hard; git pull '"'${gitAccess}'"
ssh-agent bash -c "$sshCommand"

cd $wwwPath
######## start usług ###########################
sudo docker exec -d php php-fpm

(cd $wwwPath; sudo docker-compose stop nginx)
(cd $wwwPath; sudo docker-compose start nginx) 
(cd $wwwPath; sudo docker exec -ti nginx service nginx start)

(cd $wwwPath; sudo docker-compose stop php)
(cd $wwwPath; sudo docker-compose start php)
(cd $wwwPath; sudo docker exec -d php php-fpm)

(cd $wwwPath; sudo docker-compose stop postgres)
(cd $wwwPath; sudo docker-compose start postgres)

echo "Kod podegrany"