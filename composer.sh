#!/bin/bash
source "./configs/config.ini"
if $composer -eq 1; 
then
  sudo docker exec -ti composer composer install
fi



