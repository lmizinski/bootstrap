#!/bin/bash
source "./configs/config.ini"
source "functions.sh"

cd $dockerArtisanPath;
print_message "Running: artisan migrate" 'yellow'
sudo docker exec -ti php php "$dockerArtisanPath" migrate
print_message "Running: artisan migrate:status" 'yellow'
sudo docker exec -ti php php "$dockerArtisanPath" migrate:status