#!/usr/bin/env bash
cd -P -- "$(dirname -- "$0")"
set -ev


sudo apt update
sudo apt upgrade -y

# Install Packages
sudo apt install -y vim
sudo apt install -y python python3
sudo apt install -y build-essential curl git python-setuptools ruby

# Linuxbrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"

