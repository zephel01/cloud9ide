#!/bin/bash

#xcode install
xcode-select --install
xcode-select -version

#home brew insyall
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#install cssk
brew install cask

#install iterm2
brew cask install iterm2
brew reinstall iterm2
