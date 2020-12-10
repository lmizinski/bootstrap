#!/bin/bash
source "./configs/config.ini"

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

echo "Creating $localvolumePath"
mkdir "$localvolumePath"
echo "Creating $logsPath"
mkdir "$logsPath"
echo "Creating $nginxPath"
mkdir "$nginxPath"
echo "Creating $postgresqlPath"
mkdir "$postgresqlPath"
if [ -d "$wwwPath" ] 
then
    echo "Deleting ${wwwPath}"
    sudo rm -r "$wwwPath"
fi
echo "Creating $wwwPath"
mkdir "$wwwPath"
sshCommand='ssh-add ssh/id_rsa; git clone '"'${gitAccess}' '${wwwPath}'"
echo "Installing git: $sshCommand"
ssh-agent bash -c "$sshCommand"
cd $wwwPath
cp "$envFile" .env


cd $scriptsPath
bash setup_docker.sh
#bash composer.sh
#bash laravel.sh
#bash files.sh
#bash npm.sh

echo "Pierwsza część zakończona"

#sudo docker exec -d php php-fpm
#bash test_enviroment.sh