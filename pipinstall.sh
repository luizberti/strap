#!/bin/sh -ev
cd -P -- "$(dirname -- "$0")"

sudo pip3 install --upgrade pip
sudo pip3 install -r bundles/pipfile.txt
