export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8

# ZSH_THEME="murakami"
POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir newline vcs)

ZSH_THEME="powerlevel9k/powerlevel9k"
COMPLETION_WAITING_DOTS="true"

plugins=(git bundler rake ruby rails heroku)

source $ZSH/oh-my-zsh.sh
# SOURCE ALIASES LIKE THIS GUY
# https://github.com/jesperorb/dotfiles/blob/master/.zshrc

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

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
