#!/bin/bash
source "./configs/config.ini"

const_TextPlain='\e[0m'  
const_TextYellow='\e[1;33m' 

if [[ "$laravel" -eq 1 ]]; then
  printf '%b' "${const_TextYellow}" "Running laravel" "${const_TextPlain}" '\n'
  sudo docker exec -ti php php $dockerArtisanPath key:generate
  sudo docker exec -ti php php $dockerArtisanPath storage:link
fi



