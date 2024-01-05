# My Linux / Windows / WSL dotfiles 

My dotfiles collection for Linux and Windows systems. 

## Initialize git in home directory 

Git must be installed an configured.

Run the following commands in your home directory:
```
git init
git remote add origin git@github.com:elberfeld/dotfiles.git
git config status.showUntrackedFiles no
git pull
git switch main
```

On Windows the following additional commands are needed:
```
git config --global --add safe.directory %USERPROFILE:\=/%
```

Existing local files must be checked and deleted. 
Alternatively ``` git switch -f main ``` wil checkout and overwrite all files.