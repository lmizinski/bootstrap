#!/bin/bash
source "./configs/config.ini"

cd $wwwPath

ssh-agent bash -c 'ssh-add ./../../id_rsa; git reset --hard; git pull "git@github.com:ze-it/projekt-scania.git"'

sudo docker exec -ti composer composer install
sudo docker exec -ti php php /var/www/html/www/artisan migrate

cd $scriptsPath
bash files.sh
bash npm_update.sh

cd $wwwPath
######## start usług ###########################
sudo docker exec -d php php-fpm

echo "Aktualizacja zakończona"