#!/bin/bash

# Setup ~/.mas to contain "email:password"
MAS_EMAIL=`cat .mas | cut -f1 -d':'`
MAS_PASSWORD=`cat .mas | cut -f2 -d':'`

# install xcode tools
xcode-select --install

#----------------------------
# Homebrew
#----------------------------
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

export PATH="/usr/local/bin:$PATH"

brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php
brew tap caskroom/cask

# Split off newlines
IFS=$'\n'

# Loop brew install
if [[ -a brew.txt ]];then
	for package in `cat brew.txt`; do
		brew install $package
	done
fi
# Loop cask install
if [[ -a cask.txt ]];then
	for package in `cat cask.txt`; do
		brew cask install $package
	done
fi
# Loop MAS install
if [[ -a mas.txt ]];then
	mas signin $MAS_EMAIL $MAS_PASSWORD
	for package in `cat mas.txt`; do
		id=`echo $package | cut -f1 -d' '`
		mas install $id
	done
	mas signout
fi

# Remove brew cache
rm -r `brew --cache`
rm -rf /usr/local/Caskroom/*

# Node
if [[ -a npm.txt ]];then
	for package in `cat npm.txt`; do
		npm install -g $package
	done
fi

# Loop gems install
if [[ -a gems.txt ]];then
	for package in `cat gems.txt`; do
		gem install $package
	done
fi

# Oh-My-ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Default .gitignore
cp default_gitignore.txt ~/.gitignore
git config --global core.excludesfile '~/.gitignore'

# Sublime Text CLI
if [[ -a /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ]];then
	ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
fi

# VS Code CLI
if [[ -a /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code ]];then
	ln -s /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code /usr/local/bin/code
fi

source ~/.zshrc

#----------------------------
# Post Insall Setup
#----------------------------
#
# Setup .zshrc file
# Change default shell to be /usr/local/bib/zsh
# $ git config --global user.name "Your Name Here"
# $ git config --global user.email "your_email@youremail.com"
# $ ssh-keygen -t rsa -C "your_email@example.com"
# $ gem install stake
# $ stake help -c > ~/.stake_options
# $ gem cleanup
# $ brew cleanup
# $ brew doctor

# Sublime Package Manager
# import urllib.request,os,hashlib; h = '7183a2d3e96f11eeadd761d777e62404' + 'e330c659d4bb41d3bdf022e94cab3cd0'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://sublime.wbond.net/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
