#!/bin/bash
source "./configs/config.ini"
source "functions.sh"

print_message "git pull" 'yellow'
cd $wwwPath
sshCommand='ssh-add ../../scripts/ssh/id_rsa; git reset --hard; git pull '"'${gitAccess}'"
ssh-agent bash -c "$sshCommand"

bash "$scriptsPath/restart_services.sh"

print_message "Code updated & services restarted" 'green'