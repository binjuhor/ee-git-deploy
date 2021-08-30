# Git deploy with EasyEngine v4.x
Tested with Ubuntu 16.x ~\
Add command `git-deploy` to your VPS, help you manage your website's source code by git, forget `FTP, SFTP`, no thirdparty software needed, just Git and EasyEngine.

## Install EE & Git Deploy

```
# Run this command will install EasyEngine and git deploy in a command
wget -qO ee-git cutt.ly/ee-git && sudo bash ee-git
```
## Instructions
1.  Create a website with EasyEngine's command 

    `sudo ee site create example.com --type=wp`
2. Create git deploy for example.com's theme

    `git-deploy example.com`
3. Input your theme folder name to deploy
4. Enjoy!

## Note

To deploy WordPress plugins you can also use this way to create git deploy, but you need to edit the `/home/example.com/hooks/post-receive` file to make sure your git checkout exact source code to the right folder.

Contact me if need a help.
## Contact info

Email: kiemhd@outlook.com