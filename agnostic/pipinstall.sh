#!/bin/bash -ev

cd -P -- "$(dirname -- "$0")"
sudo pip3 install -r pipfile.txt

