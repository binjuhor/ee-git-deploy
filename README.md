# Git deploy with EasyEngine v4.x

Add command `git-deploy` to your VPS, help you manage your website's source code by git, forget `FTP, SFTP`, no thirdparty software needed, just Git and EasyEngine.

## Install EE & Git Deploy

```
# Run this command will install EasyEngine and git deploy in a command
wget -qO ee-git cutt.ly/ee-git && sudo bash ee-git
```
## Instructions
1.  Create a website with EasyEngine's command 

    `sudo ee site create example.com --type=wp`
2. Create git deploy for example.com theme

    `git-deploy example.com`
3. Edit `post-receive` with your theme and domain replace theme and domain in this file *( the `git-deploy` command auto show this file content so you just need to edit this file by vim editor)*

4. Save the file and add this remote repo to your local repo
5. Enjoy!
## Contact info

Email: kiemhd@outlook.com