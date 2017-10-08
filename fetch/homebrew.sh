#!/bin/sh -e
xcode-select --install || true
read -p "Press ENTER once CLI Tools have been installed: "

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/bundle
