# My Linux / Windows / WSL dotfiles 

## Initialize git in home directory 

```
git init
git remote add origin git@github.com:elberfeld/dotfiles.git
git config status.showUntrackedFiles no
git pull
git switch main
```

Existing local files must be checked and deleted. 
Alternatively ``` git switch -f main ``` wil checkout and overwrite all files.