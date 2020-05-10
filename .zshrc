export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="pygmalion"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
plugins=(/it history dirhistory z)
source $ZSH/oh-my-zsh.sh

alias vi="vim"
export EDITOR="vim"
set -o emacs

alias l="ls"
alias ll="ls -al"
alias rm="rm -i"
alias rc="vim ~/.zshrc && source ~/.zshrc"
alias t="tmux"
alias ta="tmux attach"

# Grep through history
hig () {
    history | grep $@
}

# Git
alias ga="git add ."
alias gc="git commit -am $@"
alias gnc="git commit -n -am $@"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias gp="git push"
alias gs="git status"
alias gbc="git branch --sort=-committerdate"
alias grm="git rebase master"

bindkey -v
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward
alias gr="pushd $(git rev-parse --show-toplevel 2> /dev/null)"

alias dr="docker run"
alias dl="docker logs"
alias dp="docker ps -a"
alias da="docker attach"

alias gbi="go build -i"

alias adc="arc diff --create"
alias adu="arc diff --update"

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

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

alias hh=hstr
export HISTFILE=~/.zsh_history
export HSTR_CONFIG=hicolor

alias beep="afplay /System/Library/Sounds/Hero.aiff"
alias ag="ag --path-to-ignore ~/.ignore"
