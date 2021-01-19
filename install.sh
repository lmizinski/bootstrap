#!/bin/bash
source "./configs/config.ini"
source "functions.sh"

PS3='Czy na pewno chcesz pobrać kod od nowa? Operacja usunie WSZYSTKIE pliki z folderu www i pobierze kod od nowa: '
options=("Kontynuuj" "Przerwij")
select opt in "${options[@]}"
do
    case $opt in
        "Kontynuuj")
            break
            ;;
        "Przerwij")
            echo -e "\n${R}Operacja aktualizacji przerwana!${S}\n"
            echo -e "\t\t[ Przerwano - phinx ]" >> lastgithash
            exit 1
            ;;
        *) echo "Nieprawidłowy wybór!";;
    esac
done

print_message "Creating $localvolumePath" 'yellow'
mkdir "$localvolumePath"
print_message "Creating $logsPath" 'yellow'
mkdir "$logsPath"
print_message "Creating $nginxPath" 'yellow'
mkdir "$nginxPath"
print_message "Creating $postgresqlPath" 'yellow'
mkdir "$postgresqlPath"
if [ -d "$wwwPath" ] 
then
    print_message "Deleting ${wwwPath}" 'yellow'
    sudo rm -r "$wwwPath"
fi
print_message "Creating $wwwPath" 'yellow'
mkdir "$wwwPath"
sshCommand='ssh-add ssh/id_rsa; git clone '"'${gitAccess}' '${wwwPath}'"
print_message "Installing git: $sshCommand" 'yellow'
ssh-agent bash -c "$sshCommand"
cd $wwwPath
cp "$envFile" .env

print_message "Running: scripts" 'yellow'
cd $scriptsPath
bash "$scriptsPath/setup_docker.sh"
bash "$scriptsPath/composer.sh"
bash "$scriptsPath/laravel.sh"
bash "$scriptsPath/files.sh"
bash "$scriptsPath/npm_install.sh"

cd $wwwPath
sudo docker exec -d php php-fpm
sudo docker exec -ti nginx service nginx restart

print_message "Instalacja zakończona" 'yellow'