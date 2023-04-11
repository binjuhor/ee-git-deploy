#!/bin/bash

DOMAIN="domain.com"
DEPLOY_DIR="/opt/easyengine/sites/${DOMAIN}/app/htdocs"
WEB_URL="https://${DOMAIN}"
GIT_FOLDER="domain.com"

while read oldrev newrev ref

do
   BRANCH=`echo $ref | cut -d/ -f3`
   if [ "master" == "$BRANCH" ];  then
    sudo git --work-tree=$DEPLOY_DIR checkout -f $BRANCH
    sudo chown -R www-data:www-data $DEPLOY_DIR
    echo "You've just deployed your ${BRANCH} branch to ${WEB_URL}"
    echo "Open ${WEB_URL} to check your changed"
   fi
   sudo chown -R git:git /home/git/$GIT_FOLDER
done
