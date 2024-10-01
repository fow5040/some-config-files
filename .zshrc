## Okta CLI Requirement
source ~/.okta/okta-login-shell-function

## Manual Go install path
export GOBIN=/Users/fwalsh/go/bin
export GOPATH=/Users/fwalsh/go
export PATH=$GOBIN:$PATH

## Manual NVIM install path
export NVIMBIN=/opt/nvim-osx64/bin
export PATH=$NVIMBIN:$PATH

## PHP Stuff
export PATH=$PATH:~/Thumbtack/website/vendor/php/composer/vendor/bin

## TT Go stuff
alias linuxgo='export GOOS=linux GOARCH=amd64'
alias macgo='unset GOOS GOARCH'
## export CGO_ENABLED=1

## For Homebrew
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"

## Postgres
export PATH="/usr/local/opt/postgresql@11/bin:$PATH"

## Android
export ANDROID_HOME="/Users/fwalsh/Library/Android/sdk"

## Local Variables
export TT_PG_SCHEMA_DIR=/Users/fwalsh/Thumbtack/postgres-schema
export TT_WEBSITE_DIR=/Users/fwalsh/Thumbtack/website
export TT_TOPHAT_DIR=/Users/fwalsh/Thumbtack/tophat
export TT_FRONTEND_DIR=/Users/fwalsh/Thumbtack/frontend

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# I think this can just go in zprofile
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## Python
#eval "$(pyenv init -)"
#
## NVM Stuff
#export NVM_DIR="/Users/fwalsh/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH=/Users/fwalsh/.local/bin:$PATHeval export PATH="/Users/fwalsh/.jenv/shims:${PATH}"
export JENV_SHELL=zsh
export JENV_LOADED=1
unset JAVA_HOME
unset JDK_HOME
source '/usr/local/Cellar/jenv/0.5.6/libexec/libexec/../completions/jenv.zsh'
jenv rehash 2>/dev/null
jenv refresh-plugins
jenv() {
  type typeset &> /dev/null && typeset command
  command="$1"
  if [ "$#" -gt 0 ]; then
    shift
  fi

  case "$command" in
  enable-plugin|rehash|shell|shell-options)
    eval `jenv "sh-$command" "$@"`;;
  *)
    command jenv "$command" "$@";;
  esac
}

export PATH="$HOME/.jenv/shims:$PATH"

export PATH=/usr/local/go/bin:$PATH
