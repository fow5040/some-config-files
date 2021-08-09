## Mini Summary

For java and other things

After cloning...


#### Install:
    `git submodule update --init`

#### Upgrade:
    `cd <bundle directory>` 
    `git pull origin master`

#### Or:
    `git submodule foreach git pull origin master`

#### Add module:
    `cd .vim`
    `git submodule add <url> bundle/reponame`
    `git add *`
    `git commit -m "commit message"`


### Requirements:
|plugin |requirement|
|---    |---        |
|most   | vim, +python |
|vim-clang   | clang installed |
|vim-markdown-preview | Grip, xdotool (Linux) |
