export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=/home/d1rtyvans/.oh-my-zsh
export LANG=en_US.UTF-8

ZSH_THEME="murakami"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git bundler rake ruby rails heroku)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# YAG's SETTINGS

# kewl stuff
alias c="clear"
alias ll="ls -al"
alias path='echo $PATH | tr -s ":" "\n"'
alias rf="source ~/.zshrc"

# Git butter
alias g="git"
alias l="g sla"
alias m="g commit -m"
alias p="g add --patch"
alias s="g status"
alias v="g commit -v"

# RBENV
export PATH="$HOME/.rbenv/bin:$PATH"

eval "$(rbenv init -)"
