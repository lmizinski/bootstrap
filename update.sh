#!/bin/bash
source "./configs/config.ini"
source "functions.sh"

cd $wwwPath
sshCommand='ssh-add ../../scripts/ssh/id_rsa; git reset --hard; git pull '"'${gitAccess}'"
ssh-agent bash -c "$sshCommand"

print_message "Running: composer install" 'yellow'
sudo docker exec -ti composer composer install
print_message "Running: artisan migrate" 'yellow'
sudo docker exec -ti php php "$dockerArtisanPath" migrate
echo "Running: artisan migrate:status" 'yellow'
sudo docker exec -ti php php "$dockerArtisanPath" migrate:status

cd $scriptsPath
bash "$scriptsPath/files.sh"
bash "$scriptsPath/npm_update.sh"

cd $wwwPath
######## start usług ###########################
sudo docker exec -d php php-fpm

echo "Aktualizacja zakończona"