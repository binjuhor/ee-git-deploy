#!/bin/bash

if [ "$#" -ne 1 ]
then
  echo "Usage: git-deploy {git-name}"
  exit 1
fi
# Take the search string
read -p "Enter the theme name: " PROJECT_NAME

GIT_NAME=$1
USER_DIR='/home/git'
GIT_DIR="${USER_DIR}/${GIT_NAME}"
SOURCE_DIR="/opt/easyengine/sites/${GIT_NAME}/app/htdocs/wp-content/themes/${PROJECT_NAME}"
CURRENT_IP="$(dig +short myip.opendns.com @resolver1.opendns.com)"
git init --bare $GIT_DIR
wget -qO post-receive raw.githubusercontent.com/binjuhor/ee-git-deploy/master/post-receive

if [ $PROJECT_NAME != "" ]; then
  sed -i.bak "s/\<theme_name\>/${PROJECT_NAME}/g" post-receive
fi

sed -i.bak "s/\<theme_name\>/${GIT_NAME}/g" post-receive
mv post-receive $GIT_DIR/hooks/post-receive
chmod +x $GIT_DIR/hooks/post-receive
# vi $GIT_DIR/hooks/post-receive # Let you edit your domain and config text
mkdir $SOURCE_DIR

chown -R git:git $GIT_DIR
chown -R www-data:www-data $SOURCE_DIR

echo "You can add this repo to deploy your theme"
echo "git remote add live git@${CURRENT_IP}:${GIT_NAME}"