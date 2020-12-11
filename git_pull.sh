#!/bin/bash
source "./configs/config.ini"

cd $wwwPath
sshCommand='ssh-add ../../scripts/ssh/id_rsa; git reset --hard; git pull '"'${gitAccess}'"
ssh-agent bash -c "$sshCommand"

cd $wwwPath
######## start usług ###########################
sudo docker exec -d php php-fpm

(cd /home/lmi/app/localvolume/www; sudo docker-compose stop nginx)
(cd /home/lmi/app/localvolume/www; sudo docker-compose start nginx) 
(cd /home/lmi/app/localvolume/www; sudo docker exec -ti nginx service nginx start)

(cd /home/lmi/app/localvolume/www; sudo docker-compose stop php)
(cd /home/lmi/app/localvolume/www; sudo docker-compose start php)
(cd /home/lmi/app/localvolume/www; sudo docker exec -d php php-fpm)

echo "Kod podegrany"