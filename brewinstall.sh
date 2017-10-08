#!/bin/sh -ev
cd -P -- "$(dirname -- "$0")"

tempdir=$(mktemp -d)
cp bundles/brewfile.rb $tempdir/Brewfile
pushd $tempdir
brew bundle
brew cleanup
brew cask cleanup
popd
