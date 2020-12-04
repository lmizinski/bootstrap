## What's this
It's scafolding that allows you to deploy quickly an app from github private repository and install all necesary docker containers.
Access to git repository through Deploy Key in github.
https://developer.github.com/v3/guides/managing-deploy-keys/#deploy-keys
You include components required inside your project in project_path/docker-compose.yml
One container - one service.
Works for (tested):
 * PHP / Laravel  (installed in /var/www/html/www)
 * npm
 * postgres, mssrv

## Server requirements
 * user has to be added to sudoers??
 * server has to have git installed
 * server has to have docker oraz docker-compose installed

## Settings
Settings are stored in scripts_path/configs/config.ini. 
Copy file scripts_path/configs/config.ini.example to scripts_path/configs/config.ini to edit settings like:
 * scriptsPath="/home/username/app/scripts"         - this is the path that you git pull your scripts
 * appPath="/home/username/app/localvolume"         - this is the path that the app will be installed
 * appGitUser="git"                                 - git username
 * appGitUrl="https://github.com/github_username/github_project_id" - your github app URL
 * appBranch=master                                 - branch that you want to deploy
 * laravel=1                                        - your app includes laravel
 * composer=1                                       - your app includes composer
 * npm=1                                            - your app includes npm

## File list
 * test_enviroment.sh - tests whether all necesary requirements are preinstalled
 * generate_ssh.sh - creates ssh key, which has to be added to git Deploy Key, to be able to access code
 * install.sh - dowloads code from your git repo specified in settings file,
 * update.sh - updates code from your git repo specified in settings file,
 * setup_docker.sh - creates containers and checks status
 
## Instalation process
Username is your linux user name. You can check it with "whoami" command.
 * if the folder where you want your scripts to be installed doesn't exist, create it ( mkdir "/home/username/app/scripts" )
 * go to the folder  ( cd "/home/username/app/scripts" )
 * download scripts ( git clone https://github.com/lmizinski/bootstrap . )
 * test if all necesary software is installed ( bash /home/username/app/scripts/test_enviroment.sh )
 * copy settings file ( cp /home/username/app/scripts/configs/config.ini.example /home/username/app/scripts/configs/config.ini )
 * update settings file ( mcedit /home/username/app/scripts/configs/config.ini )
 * test if all necesary software is installed ( bash /home/username/app/scripts/test_enviroment.sh )
 * install app (bash /home/username/app/scripts/install.sh)
 * setup docker (bash /home/username/app/scripts/install.sh) 