alias ls='ls -G'
alias todo='vi ~/Scratch/todo/todo.content'

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm


set -o vi

latest-log-in-directory () {
    ls -ltr *.log | tail -n1 | awk '{print $NF}' | tr '\n' ' '
}
