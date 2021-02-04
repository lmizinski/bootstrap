#!/bin/bash
source "./configs/config.ini"
source "functions.sh"

cd $wwwPath
sshCommand='ssh-add ../../scripts/ssh/id_rsa; git reset --hard; git pull '"'${gitAccess}'"
ssh-agent bash -c "$sshCommand"

print_message "Running: composer install" 'yellow'
sudo docker exec -ti composer composer install

print_message "Running: php artisan config:clear" 'yellow'
cd $wwwPath
sudo docker-compose exec php bash -c "(cd /var/www/html/www && php artisan config:clear)"

print_message "Running: scripts" 'yellow'
cd $scriptsPath
bash "$scriptsPath/database_migrate.sh"
bash "$scriptsPath/files.sh"
bash "$scriptsPath/npm_update.sh"

cd $wwwPath
######## start usług ###########################
sudo docker exec -d php php-fpm

cd $scriptsPath
bash "$scriptsPath/restart_services.sh"

echo "Aktualizacja zakończona"