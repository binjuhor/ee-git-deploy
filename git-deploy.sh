#!/bin/bash

if [ "$#" -ne 1 ]
then
  echo "Usage: git-deploy {project-name}"
  exit 1
fi

PROJECT_NAME=$1

USER_DIR='/home/git'

GIT_DIR="${USER_DIR}/${PROJECT_NAME}"

git init --bare $GIT_DIR

cp -r $USER_DIR/post-receive $GIT_DIR/hooks/ # Create a post-receive file in /home/git

vi $GIT_DIR/hooks/post-receive

chown -R git:git $GIT_DIR

echo "You can add this repo to deploy"

echo "git remote add live git@45.76.45.4:${PROJECT_NAME}"