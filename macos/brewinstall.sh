#!/usr/bin/env bash
cd -P -- "$(dirname -- "$0")"
set -e


if hash brew 2> /dev/null; then
    echo "Will now attempt to install Command Line Tools..."
    xcode-select --install || true
    read -p "Press ENTER once CLTs have been installed: "
    read -p "Are you sure they have been installed? [ENTER]"
    echo "Will now attempt to install Homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if brew tap | grep -q 'homebrew/bundle'; then
    brew tap homebrew/bundle
fi


echo "Will now attempt to install brew bundle..."
echo "(script will be set to verbose until completion)"
set -v

tempdir=$(mktemp -d)
cp brewfile.rb $tempdir/Brewfile

pushd $tempdir
brew bundle
brew cleanup
brew cask cleanup
popd

