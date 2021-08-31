#!/bin/bash

if [ "$#" -ne 2 ]
then
  echo "Usage: ee-git {domain} {theme_name}"
  exit 1
fi

GIT_NAME=$1
PROJECT_NAME=$2
USER_DIR='/home/git'
GIT_DIR="${USER_DIR}/${GIT_NAME}"
SOURCE_DIR="/opt/easyengine/sites/${GIT_NAME}/app/htdocs/wp-content/themes/${PROJECT_NAME}"
CURRENT_IP="$(dig +short myip.opendns.com @resolver1.opendns.com)"
git init --bare $GIT_DIR
wget -qO post-receive raw.githubusercontent.com/binjuhor/ee-git-deploy/master/post-receive.sh

sed -i "s/\<theme_name\>/${PROJECT_NAME}/g" post-receive
sed -i "s/\<yourdomain.com\>/${GIT_NAME}/g" post-receive

mv post-receive $GIT_DIR/hooks/post-receive
chmod +x $GIT_DIR/hooks/post-receive
mkdir $SOURCE_DIR

chown -R git:git $GIT_DIR
chown -R www-data:www-data $SOURCE_DIR

echo -e "\n\e[33mCopy and run the command below in your local repo: \033[0m"
echo -e "\e[1;92mgit remote add live git@${CURRENT_IP}:${GIT_NAME}\033[0m"
echo -e "\e[33mRun \e[1;92mgit push live master\e[0;33m command to push code to your theme\033[0m\n"