# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="pygmalion"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(/it history dirhistory z)

source $ZSH/oh-my-zsh.sh

alias vi="vim"
export EDITOR=vim
set -o emacs

# Common aliases
alias l="ls"
alias ll="ls -al"
alias rm="rm -i"
alias rc="vim ~/.zshrc && source ~/.zshrc"
alias t="tmux"
alias ta="tmux attach"
alias vs="vim -S"

# Grep through history
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
alias gr="pushd $(git rev-parse --show-toplevel 2> /dev/null)"
alias gbi="go build -i"

# Docker aliases
alias dr="docker run"
alias dl="docker logs"
alias dp="docker ps -a"
alias da="docker attach"

# Golang aliases
alias gbi="go build -i"

# Rename a tab
function title {
    echo -e "\033];$@\007"
}

# Copy local to remote on file system changes
function _fswatch {
    if [[ -n "$1" ]]; then
    	rsync -avP --exclude=env/ $PWD/ $@
    	afplay "/System/Library/Sounds/Morse.aiff"
    else
        echo "Please specify a remote directory to copy to"
	exit 1
    fi
}

function fswatch_wa {
    # e.g., `fswatch -o . | while read; do _fswatch server_name:~/; done`
    fswatch -o . | while read; do _fswatch $@; done
}
