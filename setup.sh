#!/bin/bash
wget -qO ee rt.cx/ee4 && sudo bash ee # Make sure we installed EasyEngine
useradd git # Add new user named git
usermod -aG sudo git # Add git to sudo group run as root account
chsh -s $(command -v git-shell) git # Set only git command to git account
echo "git ALL=(ALL) NOPASSWD: ALL" >>  /etc/sudoers #add at the end of that file
mkdir /home/git # folder will contain git files
chown -R git:git /home/git # permision to git folder

# Create command git-deploy 
wget -qO git-deploy.sh raw.githubusercontent.com/binjuhor/ee-git-deploy/master/git-deploy.sh
chmod +x git-deploy.sh
mv ./git-deploy.sh /usr/local/bin/git-deploy
