#!/bin/bash
source "./configs/config.ini"
if $laravel -eq 1; 
then
  echo "Running laravel"
  sudo docker exec -ti php php $dockerArtisanPath key:generate
  sudo docker exec -ti php php $dockerArtisanPath storage:link
fi



