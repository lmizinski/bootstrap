#!/bin/bash
source "./configs/config.ini"
source "functions.sh"

print_message "git fetch origin; git reset --hard origin/master;" 'yellow'
cd $wwwPath
sshCommand='ssh-add ../../scripts/ssh/id_rsa;  git fetch origin; git reset --hard origin/master;'
ssh-agent bash -c "$sshCommand"

cd $scriptsPath
bash "$scriptsPath/restart_services.sh"

print_message "Code updated" 'green'