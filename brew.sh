#!/usr/bin/env bash

# Check to see if Homebrew is installed, and install it if it is not
which -s brew
if [[ $? != 0 ]] ; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

echo "\nInstalling Brewfile..."

# NVM Tasks
source ~/.zshrc
nvm install --lts=erbium
npm install -g @microsoft/rush
