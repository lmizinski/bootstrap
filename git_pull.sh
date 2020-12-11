#!/bin/bash
source "./configs/config.ini"

cd $wwwPath
sshCommand='ssh-add ../../scripts/ssh/id_rsa; git reset --hard; git pull '"'${gitAccess}'"
ssh-agent bash -c "$sshCommand"

cd $wwwPath
######## start usług ###########################
sudo docker exec -d php php-fpm

echo "Kod podegrany"