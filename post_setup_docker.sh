#!/bin/bash
source "./configs/config.ini"
source "functions.sh"

bash "$scriptsPath/laravel_database.sh"

echo "Instalacja zakończona"