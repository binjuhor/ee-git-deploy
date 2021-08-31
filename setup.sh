#!/bin/bash
wget -qO ee rt.cx/ee4 && sudo bash ee # Make sure we installed EasyEngine
useradd git # Add new user named git
usermod -aG sudo git # Add git to sudo group run as root account
chsh -s $(command -v git-shell) git # Set only git command to git account
echo "git ALL=(ALL) NOPASSWD: ALL" >>  /etc/sudoers #add at the end of that file
mkdir /home/git # folder will contain git files
chown -R git:git /home/git # permision to git folder

# Create command ee-git
wget -qO ee-git raw.githubusercontent.com/binjuhor/ee-git-deploy/master/ee-git.sh
chmod +x ee-git
mv ./ee-git.sh /usr/local/bin/ee-git
echo -e "\e[33mRun \e[1;92mee-git yourdomain.com theme_name\e[0;33m command setup git deploy for your theme\033[0m\n"