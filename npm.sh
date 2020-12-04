#!/bin/bash
source "./configs/config.ini"
if $npm -eq 1; 
then
    ######## pobieranie nowych bibliotek kodu ###################
	sudo docker exec -ti npm npm install
	sudo docker exec -ti npm npm rebuild
	sudo docker exec -ti npm npm run watch
	######## kompilowanie kodu ###################
	sudo docker exec -d npm npm run production &
fi



