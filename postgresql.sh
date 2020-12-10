#!/bin/bash
source "./configs/config.ini"
if $postgresql -eq 1; 
then
  echo "Creating $postgresqlPath"
  mkdir "$postgresqlPath"
fi