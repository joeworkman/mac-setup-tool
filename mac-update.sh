#!/bin/bash

# Homebrew Update
brew update
brew upgrade
brew cleanup
brew doctor
rm -rf `brew --cache`

# Ruby Gem Update
gem update
gem cleanup

# Node Update
npm update -g
