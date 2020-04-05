# TODO:
# - Symlink these source files
# - Add env example for shopify environment variables
# - Let root use same dotfiles
# - Find a cooler better way to source NVM than the one in config
source $HOME/dotfiles/zsh/paths
source $HOME/dotfiles/zsh/config
source $HOME/dotfiles/zsh/aliases

# Fuzzy find git branch
function co() {
  branch=`git branch -a | sed 's/^\*//; s/^[ \t]*//; /HEAD.*/d; /^remotes\/origin\/$/d' | fzf --height 40% --border --reverse --preview 'git log --color=always {} -10' | sed 's/remotes\/origin\///'`
  if [[ $branch ]]; then
    git checkout $branch
  fi
}
