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

sudo rm -r "$localPath"
mkdir "$localPath"
gitAccess = "${appGitUser}@${appGitUrl}"
ssh-agent bash -c 'ssh-add ssh/id_rsa; git clone "$gitAccess" "$wwwPath"'
cd $wwwPath
cp .env.prod .env

#bash composer.sh
#bash laravel.sh
#bash files.sh
#bash npm.sh


#sudo docker exec -d php php-fpm
echo "PHP started"
#bash test_enviroment.sh