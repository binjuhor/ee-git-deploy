#!/bin/bash

if [ "$#" -ne 1 ]
then
  echo "Usage: git-deploy {project-name}"
  exit 1
fi

PROJECT_NAME=$1
USER_DIR='/home/git'
GIT_DIR="${USER_DIR}/${PROJECT_NAME}"
CURENT_IP="$(dig +short myip.opendns.com @resolver1.opendns.com)"
# POST_RECEIVE_CONTENT=$(curl -L raw.githubusercontent.com/binjuhor/ee-git-deploy/master/post-receive)
git init --bare $GIT_DIR
# echo $POST_RECEIVE_CONTENT > $GIT_DIR/hooks/post-receive
wget -qO post-receive raw.githubusercontent.com/binjuhor/ee-git-deploy/master/post-receive
mv post-receive $GIT_DIR/hooks/post-receive
chmod +x $GIT_DIR/hooks/post-receive
vi $GIT_DIR/hooks/post-receive # Let you edit your domain and config text
chown -R git:git $GIT_DIR

echo "You can add this repo to deploy"
echo "git remote add live git@${CURENT_IP}:${PROJECT_NAME}"