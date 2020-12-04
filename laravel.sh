#!/bin/bash
source "./configs/config.ini"
if $laravel -eq 1; 
then
  sudo docker exec -ti php php $dockerArtisanPath key:generate
  sudo docker exec -ti php php $dockerArtisanPath storage:link
fi



