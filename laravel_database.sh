#!/bin/bash
source "./configs/config.ini"

######## operacje na bazie danych - dopiero po ręcznej aktualizacji configu ###################
if [[ "$laravelVoyager" -eq 1 ]]; then
  echo "Running laravelVoyager";
  sudo docker exec -ti php php $dockerArtisanPath voyager:admin your@email.com --create
  sudo docker exec -ti php php $dockerArtisanPath migrate
  sudo docker exec -ti php php $dockerArtisanPath db:seed --class=VoyagerDatabaseSeeder
fi
if [[ "$passport" -eq 1 ]]; then
  echo "Running passport:install";
  sudo docker exec -ti php php $dockerArtisanPath passport:install
fi