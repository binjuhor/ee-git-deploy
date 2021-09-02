# Git deploy with EasyEngine v4.x


Add command `ee-git` to your VPS, help you manage your website's source code by git, forget `FTP, SFTP`, no thirdparty software needed, just Git and EasyEngine.

## Requirements

. Docker
. Docker-Compose
. PHP CLI (>=7.1)
. PHP Modules - curl, sqlite3, pcntl
## Install EE & Git Deploy

### Installing

For Linux, we have created an installer script which will install all the dependencies for you. We have tested this on Ubuntu 14.04, 16.04, 18.04 and Debian 8, Debian 10 ( Only EasyEngine supported system ).

```
# Run this command will install EasyEngine and git deploy in a command
wget -qO eeGit bit.ly/ee-git && sudo bash eeGit
```
## Usage
1.  Create a website with EasyEngine's command 

    `sudo ee site create example.com --type=wp`
2. Create git deploy for example.com's theme

    `ee-git example.com theme_name`
3. Enjoy!

## Note
You should create your website by `ee` command first after that run command `ee-git` to setup git deploy for your theme.

To deploy WordPress plugins you can also use this way to create git deploy, but you need to edit the `/home/example.com/hooks/post-receive` file to make sure your git checkout exact source code to the right folder.

Contact me if need a help.
## Contact info

Email: kiemhd@outlook.com