# Git deploy with EasyEngine v4.x

## 1. Install EasyEngine `https://easyengine.io`

```
# Install EasyEngine on Linux
wget -qO ee rt.cx/ee4 && sudo bash ee

# Create a site at example.com with WordPress
sudo ee site create example.com --type=wp
```

## 2. Add git user in root group
EasyEngine v4 run with root permission so to use git deploy with EasyEngine we need add `git` account under root permision.

Following this command:
```
useradd git # Add new user named git

usermod -aG sudo git # Add git to sudo group run as root account

chsh -s $(command -v git-shell) git # Set only git command to git account

sudo visudo # modify this files /etc/sudoers to make sure git can do anything without input password

git ALL=(ALL) NOPASSWD: ALL #add at the end of that file

mkdir /home/git # folder will contain git files

chown -R git:git /home/git # permision to git folder
```

## 3. Create git repo ready to deploy

run `git init --bare /home/git/{project_name}` to init new git repo.

Edit file `post-receive` with your project information and copy to `/home/git/{project_name}/hooks/` .


### Note:
- Remember run command `chmod +x /home/git/{project_name}/hooks/post-receive`.
- The `post-receive` in this folder apply to deploy WordPress theme with 2 repo dev and production.

## 4. Bonus

- `git-deploy.sh` make the task more easy, to run this file we need copy `post-receive` file into `/home/git` folder.
- You also can modify the file for your idea.

## 5. Contact info

Email: kiemhd@outlook.com