#!/bin/bash

set -e

bold=$(tput bold)
normal=$(tput sgr0)
pause=0.6

echo "${bold}Installing all your sweet sweet dependencies...${normal}"
sleep $pause

# Brew
if [ ! -x /usr/local/bin/brew ]; then
  echo 'Installing brew...'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Git
if [ ! -x /usr/local/bin/git ]; then
  echo 'Installing brew git...'
  brew install git
fi

sleep $pause
echo
read -p "${bold}Your whole dotfile scene is about to be nuked, are you sure you want that?${normal} [Yn]: " choice
if [ "$choice" = 'Y' ]; then
  echo "Moving any existing dotfiles to 'dotfiles_old'..."
  if [ -d $HOME/dotfiles ]; then
    rm -rf $HOME/dotfiles_old
    mv $HOME/dotfiles $HOME/dotfiles_old
  fi

  echo 'Cloning dotfile repo and vim plugins from git...'
  git clone --recurse-submodules git@github.com:d1rtyvans/dotfiles.git $HOME/dotfiles

  pushd $HOME/dotfiles
  brew bundle
  rake link
  popd
fi

if [ ! $SHELL = /bin/zsh ]; then
  echo 'Making sure zsh is your default shell...'
  chsh -s $(which zsh)
fi

if [ ! -d $HOME/.oh-my-zsh ]; then
  echo 'Installing oh mai ZEEESH'
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi


# Ruby
if [ ! $(command -v rvm) ] || [ $(which ruby) = /usr/bin/ruby ] ; then
  echo 'Installing rvm and latest ruby...'
  sleep $pause
  \curl -sSL https://get.rvm.io | bash -s stable --ruby

  # TODO: What if they have rbenv?
  source ~/.rvm/scripts/rvm
  rvm reload
fi


# Node
if [ ! -r ~/.nvm/nvm.sh ]; then
  echo 'Installing nvm...'
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
fi

source ~/.nvm/nvm.sh

if [ ! $(command -v node) ]; then
  echo 'Installing node...'
  nvm install stable
  nvm alias default $(node -v)
else
  sleep $pause
  echo
  read -p "${bold}Wanna install the latest stable version of node?${normal} [Yn]: " choice
  if [ "$choice" = 'Y' ]; then
    sleep $pause
    echo 'Installing node...'
    nvm install stable
    nvm alias default $(node -v)
  fi
fi

echo 'All done.'
