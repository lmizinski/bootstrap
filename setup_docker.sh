#!/bin/bash
source "./configs/config.ini"

const_TextPlain='\e[0m'  
const_TextYellow='\e[1;33m' 

cd $wwwPath

printf '%b' "${const_TextYellow}" "Postawienie kontenerów dockera z pliku docker-compose.yml" "${const_TextPlain}" '\n'
sudo docker-compose up -d --build
printf '%b' "${const_TextYellow}" "Sprawdzenie kontenerów (wszystkie kontenery powinne mieć status up) " "${const_TextPlain}" '\n'
sudo docker-compose ps
sleep 20