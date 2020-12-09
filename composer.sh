#!/bin/bash
source "./configs/config.ini"
if $composer -eq 1; 
then
  cd "$wwwPath"
  echo "Running composer"
  sudo docker exec -ti composer composer install
fi
