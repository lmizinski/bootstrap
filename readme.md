## What's this
It's scafolding that allows you to deploy quickly an app from github private repository and install all necesary docker containers.
Access to git repository through Deploy Key in github.
https://developer.github.com/v3/guides/managing-deploy-keys/#deploy-keys
You include components required inside your project in `project_path/docker-compose.yml`
One container - one service.
Works for (tested):
 * PHP / Laravel  (installed in `/var/www/html/www`)
 * npm
 * postgres, mssrv

## Server requirements
 * user has to be added to sudoers
 * server has to have git installed
 * server has to have docker and docker-compose installed

## Settings
Settings are stored in scripts_path/configs/config.ini. 
Copy file scripts_path/configs/config.ini.example to scripts_path/configs/config.ini to edit settings like:
 * `scriptsPath`="/home/username/app/scripts"         - this is the path that you git pull your scripts
 * `appPath`="/home/username/app/code"                - this is the path that the app will be installed
 * `appGitUser="git"`                                 - git username
 * `appGitUrl="https://github.com/github_username/github_project_id"` - your github app URL
 * `appBranch=master`                                 - branch that you want to deploy
 * `laravel=1`                                        - your app includes laravel
 * `composer=1`                                       - your app includes composer
 * `npm=1`                                            - your app includes npm

## File list
 * test_enviroment.sh - tests whether all necesary requirements are preinstalled
 * generate_ssh.sh - creates ssh key `ssh\id_rsa.pub`. This file has to be added to git Deploy Key, to be give your server access to your github repository
 * install.sh - dowloads code from your git repo specified in settings file,
 * update.sh - updates code from your git repo specified in settings file,
 * setup_docker.sh - creates containers and checks status
 
## Instalation process
Username is your linux user name. You can check it with "whoami" command.

Follow these steps to install app:
 * if the folder where you want your scripts to be installed doesn't exist, create it `sudo mkdir "/home/username/app/scripts"`
 * go to the folder  `sudo cd "/home/username/app/scripts"`
 * download scripts `sudo git clone https://github.com/lmizinski/bootstrap .`
 * test if all necesary software is installed `sudo bash /home/username/app/scripts/test_enviroment.sh`
 * copy settings file `sudo cp /home/username/app/scripts/configs/config.ini.example /home/username/app/scripts/configs/config.ini`
 * update settings file `sudo mcedit /home/username/app/scripts/configs/config.ini`
 * generate ssh key `sudo bash /home/username/app/scripts/generate_ssh.sh`. This will create file `ssh\id_rsa.pub`. This file has to be added to git Deploy Key, to be give your server access to your github repository.
 * test if all necesary software is installed `sudo bash /home/username/app/scripts/test_enviroment.sh`
 * install app `sudo bash /home/username/app/scripts/install.sh $USER`
 * setup docker `sudo bash /home/username/app/scripts/setup_docker.sh` 
 * run scripts that require docker running `sudo bash /home/username/app/scripts/post_setup_docker.sh` 
