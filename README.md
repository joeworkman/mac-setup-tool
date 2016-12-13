# Mac Setup tool

This is a simple shell script that helps automate the setup of your terminal environment and apps on a new Mac. This script is opinionated since it assumes that you want/have certain things, like `zsh`. 


This app will do the following... 

1. Install homebrew and all brew packages
2. Use Cask to download and install non-app store apps
3. Use MAS clie to download and install app store apps
4. Install Node and npm global packages
5. Installs oh-my-zsh
6. Installs default .gitignore file
7. Sets up Sublime Text CLI
8. Installs RVM + ruby + gems


### Install Xcode 

You need to have Xcode installed before running this app. This is so that all of the software packages can be compiled on your machine. 


### Important files

The following files will need to be customized for your machine. 


#### zshrc.txt

Shell RC files are very personal. Here is a version of mine that you can use as a good starting point. Place the content of this file into `~/.zshrc`. 


#### brew.txt

This file is a simple list of homebrew packages that you want to get installed. You must have the following packages installed if you want to use other features of this script: `cask`, `mas`, `node`


#### cask.txt

This file contains all of the non-App Store apps that you want to download and install on your machine. You can see a full list of apps supported at <https://caskroom.github.io>.


#### gems.txt

This file contains all of the ruby gems that you want to install. 


#### mas.txt

This file contains a list of all App Store apps that you would like to install by default. In order for this to work, the script will need you MAS login credentials. 

You can provide these credentials inside of the following file: `~/.mas` 

With the following format: `email@mac.com:password`

You will notice that the `mas.txt` file has a particular format. You can use the file supplied in this repo as a starter. However, you can generate your own list by running the following command on another Mac using the mas CLI: `mas list`

For more info on the mas CLI, head over to <https://github.com/mas-cli/mas>


#### npm.txt

This file contains a list of global npm packages to install


### Post Install Stuff

Here is just a small list of things that you may want to setup after you have ran this script. 

```
$ git config --global user.name "Your Name Here"
$ git config --global user.email "your_email@youremail.com"
$ ssh-keygen -t rsa -C "your_email@example.com"
$ gem install stake
$ stake help -c > ~/.stake_options
$ gem cleanup
$ brew cleanup -s
$ brew doctor
```
