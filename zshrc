# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="pygmalion"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(git history dirhistory z)

source $ZSH/oh-my-zsh.sh

alias vi="vim"
export EDITOR=vim
set -o vi                                                                                                                                                                                                   
alias l="ls"
alias ll="ls -al"
alias rm="rm -i"
alias rc="vim ~/.zshrc && source ~/.zshrc"
alias t="tmux"
alias ta="tmux attach"
alias vs="vim -S"

hig () {
    history | grep $@
}

# Git
alias ga="git add ."
alias gc="git commit -am $@"
alias gco="git checkout"
alias gp="git push"
alias gs="git status"
alias grm="git rebase master"

bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward
alias gr="pushd $(git rev-parse --show-toplevel)"
