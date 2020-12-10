#!/bin/bash
source "./configs/config.ini"

const_TextPlain='\e[0m'  
const_TextYellow='\e[1;33m' 

if [[ "$postgresql" -eq 1 ]]; then
  printf '%b' "${const_TextYellow}" "Creating $postgresqlPath" "${const_TextPlain}" '\n'
  mkdir "$postgresqlPath"
fi