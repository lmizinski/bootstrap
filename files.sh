#!/bin/bash
source "./configs/config.ini"

const_TextPlain='\e[0m'  
const_TextYellow='\e[1;33m' 
printf '%b' "${const_TextYellow}" "Changing file permissions" "${const_TextPlain}" '\n'
######## uprawnienia do plików ###################
echo "1/5"
sudo docker exec -ti php chown -R root:www-data $dockerWwwPath
echo "2/5"
sudo docker exec -ti php find $dockerWwwPath -type d -exec chmod 775 {} \;            #tylko foldery
echo "3/5"
sudo docker exec -ti php find $dockerWwwPath -type f -exec chmod 644 {} \;            #tylko pliki
echo "4/5"
sudo docker exec -ti php chgrp -R www-data "${dockerWwwPath}/storage" "${dockerWwwPath}/bootstrap/cache"  #storage,cache - tylko foldery
echo "5/5"
sudo docker exec -ti php chmod -R ug+rwx "${dockerWwwPath}/storage" "${dockerWwwPath}/bootstrap/cache"    #storage,cache - tylko pliki
echo "done"