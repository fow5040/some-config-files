alias vi="nvim"
alias vim="nvim"
alias qvi="nvim -u NONE"

alias ls='ls -G'
alias todoold='vi ~/Scratch/todo/todo.content'
alias todo='vi ~/obsidian/main/_TODO.md'

alias macceloff='defaults write .GlobalPreferences com.apple.mouse.scaling -integer  -1'

#go shortcuts
export gorepo="/Users/fwalsh/go/src/github.com/thumbtack/go"
alias godeps='cd $gorepo; make install-deps'
alias gotest='function __gotest() { go test -cover ./$1/... ; unset -f __gotest; }; __gotest'

#thrift build shortcuts
alias tbuildphp='function __tbuildphp() { ./build.py build php $1 ~/Thumbtack/website; unset -f __tbuildphp; }; __tbuildphp' 
alias tbuildgo='function __tbuildgo() { ./build.py build go $1 $GOPATH/src/github.com/thumbtack/go; unset -f __tbuildgo; }; __tbuildgo' 

# yoda set local
alias ysl='function __ysl() { yoda switch-location $1 local; unset -f __ysl; }; __ysl'
# yoda set tunnel
alias yst='function __yst() { yoda switch-location $1 tunnel; unset -f __yst; }; __yst'
# yoda admin local
alias yal='function __yal() { echo "php /srv/thumbtack/current/bin/maintenance/privileges/give_all_privileges.php --email fwalsh@thumbtack.com --do-it-live"; yoda shell website; unset -f __yal; }; __yal'


#bashmarks
source ~/.local/bin/bashmarks.sh

#fzf && fd
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"

#so thrift builds even though you have go 1.17
alias gomodoff="export GO111MODULE=off"
alias gomodon="export GO111MODULE=on"

#website stuff
export PATH=$PATH:~/Thumbtack/website/vendor/php/composer/vendor/bin

# git thing (where do I put this?)
# git branch | grep "<pattern>" | xargs git branch -D


## yoda stuff
# yoda good morning
alias ygm="yoda good-morning"
# yoda restart sync
alias yrs="yoda restart --sync"
# yoda set local
alias ysl='function __ysl() { yoda switch-location $1 local; unset -f __ysl; }; __ysl'
# yoda set tunnel
alias yst='function __yst() { yoda switch-location $1 tunnel; unset -f __yst; }; __yst'
# yoda admin local
alias yal='function __yal() { echo "php /srv/thumbtack/current/bin/maintenance/privileges/give_all_privileges.php --email fwalsh@thumbtack.com --do-it-live"; yoda shell website; unset -f __yal; }; __yal'

alias ols='okta-login shared'
alias olst='okta-login staging'
alias old='okta-login development'

set -o vi


## Bash Autocomplete
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  
  autoload -Uz compinit
  # -i ignores inescure directories, i.e. usr/local/share
  compinit -i
fi

## Python
alias ipython="ipython --TerminalInteractiveShell.editing_mode=vi"

# this is too slow >> eval "$(pyenv init --path --no-rehash)"
# try lazy eval instead >> github.com/davidparsson/zsh-pyenv-lazy
# Try to find pyenv, if it's not on the path
export PYENV_ROOT="${PYENV_ROOT:=${HOME}/.pyenv}"
if ! type pyenv > /dev/null && [ -f "${PYENV_ROOT}/bin/pyenv" ]; then
    export PATH="${PYENV_ROOT}/bin:${PATH}"
fi

# Lazy load pyenv
if type pyenv > /dev/null; then
    export PATH="${PYENV_ROOT}/bin:${PYENV_ROOT}/shims:${PATH}"
    function pyenv() {
        unset -f pyenv
        eval "$(command pyenv init -)"
        if [[ -n "${ZSH_PYENV_LAZY_VIRTUALENV}" ]]; then
            eval "$(command pyenv virtualenv-init -)"
        fi
        pyenv $@
    }
fi

## NVM Stuff
export NVM_DIR="/Users/fwalsh/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

latest-log-in-directory () {
    ls -ltr *.log | tail -n1 | awk '{print $NF}' | tr '\n' ' '
}

## rb & iOS stuff
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH
