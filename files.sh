#!/bin/bash
source "./configs/config.ini"
echo "Changing file permissions"
######## uprawnienia do plików ###################
sudo docker exec -ti php chown -R root:www-data $dockerWwwPath
sudo docker exec -ti php find $dockerWwwPath -type d -exec chmod 775 {} \;            #tylko foldery
sudo docker exec -ti php find $dockerWwwPath -type f -exec chmod 644 {} \;            #tylko pliki
sudo docker exec -ti php chgrp -R www-data "${dockerWwwPath}/storage" "${dockerWwwPath}/bootstrap/cache"  #storage,cache - tylko foldery
sudo docker exec -ti php chmod -R ug+rwx "${dockerWwwPath}/storage" "${dockerWwwPath}/bootstrap/cache"    #storage,cache - tylko pliki




