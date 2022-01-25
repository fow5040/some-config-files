alias vi="nvim"
alias vim="nvim"

alias ls='ls -G'
alias todo='vi ~/Scratch/todo/todo.content'

set -o vi

latest-log-in-directory () {
    ls -ltr *.log | tail -n1 | awk '{print $NF}' | tr '\n' ' '
}
