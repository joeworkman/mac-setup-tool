#!/bin/bash

# Homebrew Update
brew update
brew upgrade
brew cleanup
brew doctor
rm -r `brew --cache`

# Ruby Gem Update
gem update
gem cleanup

# Node Update
npm update -g

# Composer Update


