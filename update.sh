#!/bin/bash
source "./configs/config.ini"

cd $wwwPath
sshCommand='ssh-add ssh/id_rsa; git reset --hard; git pull '"'${gitAccess}'"
ssh-agent bash -c "$sshCommand"

sudo docker exec -ti composer composer install
sudo docker exec -ti php php /var/www/html/www/artisan migrate

cd $scriptsPath
bash files.sh
bash npm_update.sh

cd $wwwPath
######## start usług ###########################
sudo docker exec -d php php-fpm

echo "Aktualizacja zakończona"