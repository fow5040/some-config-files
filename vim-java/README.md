###Mini Summary

For java and other things

After cloning...


Install:
    `git submodule update --init`

Upgrade:
    `cd <bundle directory>` 
    `git pull origin master`

Or:
    `git submodule foreach git pull origin master`

Add module:
    `cd bundle`
    `git submodule add <url> bundle/reponame`
    `git add *`
    `git commit -m "commit message"`

