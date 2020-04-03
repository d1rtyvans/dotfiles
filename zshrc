export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8

# todo put path stuff elsewhere...
export PATH=$PATH:/Users/d1rtyvans/Library/Python/2.7/bin

# Add Go
export PATH=$PATH:/usr/local/go/bin

# ZSH_THEME="murakami"
# POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_MODE="awesome-patched"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir newline vcs)

ZSH_THEME="powerlevel9k/powerlevel9k"
COMPLETION_WAITING_DOTS="true"

# TODO: Add env example for shopify environment variables
plugins=(git bundler osx rake ruby rails heroku)

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
alias spotty='spotify'

# Git butter
alias g="git"
alias l="g sla"
alias m="g commit -m"
alias p="g add --patch"
alias s="g status"
alias v="g commit -v"

alias dok="docker-compose -f docker-compose.yml -f docker-compose.mac.yml"

# nvm
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# Quick navigation to repos
export WCS="$HOME/src/west-coast-skateparks"

# Mute ruby warnings
export RUBYOPT='-W0'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$GEM_HOME/bin:$PATH"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

# Add docker-sync to path
if which ruby >/dev/null && which gem >/dev/null; then
  PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
