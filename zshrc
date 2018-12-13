export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8

ZSH_THEME="powerlevel9k/powerlevel9k"

# Not working?
# POWERLEVEL9K_VCS_FOREGROUND='021'
POWERLEVEL9K_MODE="nerdfont-complete"

# Put this powerline bs somewhere else
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user custom_ruby dir newline vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status battery)
COMPLETION_WAITING_DOTS="true"

POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND="yellow"
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND="green"
POWERLEVEL9K_BATTERY_LOW_THRESHOLD=15
POWERLEVEL9K_BATTERY_LOW_COLOR_FOREGROUND="red"
POWERLEVEL9K_BATTERY_VERBOSE=false

POWERLEVEL9K_CUSTOM_RUBY="echo -n '\ue21e'"
POWERLEVEL9K_CUSTOM_RUBY_FOREGROUND="black"
POWERLEVEL9K_CUSTOM_RUBY_BACKGROUND="red"

plugins=(
  git
  bundler
  rake
  ruby
  rails
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
# SOURCE ALIASES LIKE THIS GUY
# https://github.com/jesperorb/dotfiles/blob/master/.zshrc

# vim only plz
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# export PYTHONPATH=/Users/chris_scott/Library/Python/2.7/bin
export PATH="/usr/local/opt/python/libexec/bin:$PATH"



# kewl stuff
alias c="clear"                          # I compulsively tap this 5 times for every command
alias ll="ls -al"                        # I never actually use this
alias path='echo $PATH | tr -s ":" "\n"' # human readable path for christ's sake
alias rf="source ~/.zshrc"               # because yb is lazy
alias ez="vim ~/.zshrc"                  # LAY Z BOI

# Git butter
alias g="git"                            # again, lazy
alias l="g sla"                          # the only way to git log
alias m="g commit -m"                    # lazy
alias p="g add --patch"                  # layyyyyyyyzzeeeeee
alias s="g status"                       # ZzzZzzZzz
alias v="g commit -v"                    # HEH

# checks out first branch matching query string
# (branches are ordered by commit date DESC)
function co() {
  g co $(g b | grep -m 1 $1)
}

# Open up file(s) with conflict when rebasing
function reb() {
  rebase_output=$(g rebase $1)
  conflict=$(echo $rebase_output | grep 'CONFLICT')

  if ! [[ $conflict ]]; then
    echo $rebase_output
    return 0
  fi

  # Only do this bs if there's a conflict my g
  conflict_file=$(echo $conflict | cut -d ' ' -f 6)
  top_level_git_dir=$(echo $conflict_file | cut -d "/" -f 1 | head -1)

  # if nested git dir (ccpam has both api and auth)
  dir_contents=(*)
  if (( ${dir_contents[(I)$top_level_git_dir]} )); then
    # NEED TO TEST THIS W/ SOME SHIT BRO
    vim $(echo $conflict_file)
  else
    vim +/'<<<<<<<' $(echo $conflict_file | sed 's/^/..\//')
  fi
}

eval "$(chef shell-init zsh)"
