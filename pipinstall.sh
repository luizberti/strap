#!/usr/bin/env bash
cd -P -- "$(dirname -- "$0")"
set -ev


sudo pip3 install --upgrade pip
sudo pip3 install -r bundles/pipfile.txt
