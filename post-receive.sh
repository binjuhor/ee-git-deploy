#!/bin/bash

DOMAIN="yourdomain.com"
THEME="theme_name"
DEPLOY_DIR="/opt/easyengine/sites/${DOMAIN}/app/htdocs/wp-content/themes/${THEME}"
WEB_URL="https://${DOMAIN}"

DEV_DOMAIN='dev.yourdomain.com'
DEV_DIR="/opt/easyengine/sites/${DEV_DOMAIN}/app/htdocs/wp-content/themes/${THEME}"
DEV_URL="https://${DEV_DOMAIN}"

while read oldrev newrev ref

do

   BRANCH=`echo $ref | cut -d/ -f3`

   if [ "master" == "$BRANCH" ];  then
        sudo git --work-tree=$DEPLOY_DIR checkout -f $BRANCH
        sudo ee site clean $DOMAIN
        sudo chown -R www-data:www-data $DEPLOY_DIR
        echo "You've just deployed your ${BRANCH} branch to ${WEB_URL}"
        echo "Open ${WEB_URL} to check your changed"
   fi

   if [ "dev" == "$BRANCH" ];	then
        sudo git --work-tree=$DEV_DIR checkout -f $BRANCH
        sudo chown -R www-data:www-data $DEV_DIR
        echo "You've just deployed your ${BRANCH} branch to ${DEV_DOMAIN}"
        echo "Open ${DEV_URL} to check your changed"
   fi

   sudo chown -R git:git /home/git/$DOMAIN

done
