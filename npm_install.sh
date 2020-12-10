#!/bin/bash
source "./configs/config.ini"

const_TextPlain='\e[0m'  
const_TextYellow='\e[1;33m' 

if [[ "$npm" -eq 1 ]]; then
	printf '%b' "${const_TextYellow}" "Running npm" "${const_TextPlain}" '\n'
    ######## pobieranie nowych bibliotek kodu ###################
	sudo docker exec -ti npm npm install
	sudo docker exec -ti npm npm rebuild
	######## kompilowanie kodu ###################
	sudo docker exec -d npm npm run production
fi