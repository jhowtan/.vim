#!/bin/bash

# This script assumes fresh copy of Mac OS X. Supports versions > 10.9.X
# Will install the programs I use, and set up your computer to have a similar
# configuration to my own setup.

# Please review what the following lines do for your system instead of blindly
# running the script.

# Install homebrew (Package manager for OS X, brew.sh)
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew doctor
# export PATH=/usr/local/bin:/usr/local/sbin:$PATH at bottom of ~/.bashrc

brew install git
# Replace username and email accordingly.
git config --global user.name "jhowtan"
git config --global user.email "jhow.tan@gmail.com"
git config --global credential.helper osxkeychain

# Install basic tools I use for my OS X machine
# Google each of these packages if you're not sure what they do
brew install macvim
brew install wget
brew install tree
brew install htop-osx
brew install httpie
brew install the_silver_searcher

# 'Install vim'
# Take note of the plugins that you need to install within vim (See vundle)
git clone https://github.com/jhowtan/sysconfig.git
cd sysconfig
mv .vim ~/.vim
mv .vimrc ~/.vimrc

# If you want to use bash, retain these following lines:
mv .bash_profile ~/.bash_profile
mv .bashrc ~/.bashrc

# Configure zsh environment to replace bash
# If you don't like this, go install some other shell for yourself
# Good alternatives include Fish.
# http://hackercodex.com/guide/install-fish-shell-mac-ubuntu/
# Do take note to install any dependencies or missing packages that are
# included in .zshrc but not in .oh-my-zsh/plugins
brew install zsh
wget --no-check-certificate http://install.ohmyz.sh -O - | sh
mv .zshrc ~/.zshrc
# Initialise zsh and reload zshrc
zsh
z

# Following few sections deal with managing your development dependencies for:
# Python
brew install python --with-brewed-openssl
# export PATH=/usr/local/share/python:$PATH at bottom of ~/.bashrc
pip install virtualenv
pip install virtualenvwrapper

# PHP
brew tap josegonzalez/homebrew-php
brew tap homebrew/versions
brew install php55-intl
brew install josegonzalez/php/composer

# Ruby
brew install chruby
brew install ruby-install
# In ~/.bashrc OR ~/.zshrc
# source /usr/local/share/chruby/chruby.sh
# source /usr/local/share/chruby/auto.sh
# ruby-install command needs you to choose a ruby version:
ruby-install ruby-2.1.2
# chruby ruby-2.1.2 in ~/.bash_profile OR ~/.zshrc

# Configure chruby
echo "source /usr/local/share/chruby/chruby.sh" >> ~/.bashrc
# Enable chruby auto-switching based on .ruby-version in folder
echo "source /usr/local/share/chruby/auto.sh" >> ~/.bashrc

# Now for ~/Applications
# brew-cask package manages all your applications, use this to install/uninstall apps
brew tap phinze/homebrew-cask
brew install brew-cask

# Applications I use:
brew cask install alfred
brew cask install anki
brew cask install anki
brew cask install caffeine
brew cask install ccleaner
brew cask install coconutbattery
brew cask install dash
brew cask install dropbox
brew cask install evernote
brew cask install fluid
brew cask install flux
brew cask install iterm2
brew cask install google-chrome
brew cask install google-hangouts
brew cask install keepassx
brew cask install nvalt
brew cask install pandoc
brew cask install rescuetime
brew cask install skype
brew cask install slack
brew cask install spectacle
brew cask install spotify
brew cask install sublime
brew cask install telegram
brew cask install the-unarchiver
brew cask install transmission
brew cask install truecrypt
brew cask install tunnelblick
brew cask install vagrant
brew cask install virtualbox
brew cask install vlc

# Use Cask as a Font Book manager: install font-text
brew tap caskroom/fonts
brew cask install font-inconsolata
brew cask install font-ubuntu
brew cask install font-merriweather
brew cask install font-lato
brew cask install font-cabin
brew cask install font-open-sans

# Ensure that Alfred links up the applications
brew cask alfred link
# Cleanup all the installation files
brew cask cleanup
