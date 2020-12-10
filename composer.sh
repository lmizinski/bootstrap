#!/bin/bash
source "./configs/config.ini"

const_TextPlain='\e[0m'  
const_TextYellow='\e[1;33m' 

if [[ "$composer" -eq 1 ]]; then
  cd "$wwwPath"
  printf '%b' "${const_TextYellow}" "Running composer" "${const_TextPlain}" '\n'
  sudo docker exec -ti composer composer install
fi
