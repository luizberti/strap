#    _____ _
#   / ____| |
#  | (___ | |_ _ __ __ _ _ __
#   \___ \| __| '__/ _` | '_ \
#   ____) | |_| | | (_| | |_) |
#  |_____/ \__|_|  \__,_| .__/
#  Smarter Bootstraping | |
#          macos/ubuntu |_|

DOTFILES=$(shell find dotfiles -type f | awk -F / '{print $$NF}' | cut -d . -f-1)
PROFILE=$(shell find profile.d -type f | awk -F / '{print $$NF}')

all: install doctor


# GIT
# configures global git parameters

.PHONY: git
git:
	# USER
	git config --global user.name         'Luiz Berti'
	git config --global user.email        'luizberti@users.noreply.github.com'
	# CORE
	git config --global core.editor       vim
	git config --global core.excludesfile '~/.gitignore'
	# FETCH, PULL, PUSH
	git config --global fetch.prune            true
	git config --global push.default           current
	git config --global pull.rebase            preserve
	git config --global branch.autoSetupRebase always
	# ALIAS
	git config --global alias.lg          'log --graph --oneline --decorate --all'
	git config --global alias.browse      '!tig --all'
	git config --global alias.s           'status -sb'
	git config --global alias.c           'commit -v'
	git config --global alias.amend       'commit --amend --no-edit'
	git config --global alias.hunks       'add -p'
	git config --global alias.r           'remote -v'
	git config --global alias.b           'branch -vv'
	git config --global alias.ba          'branch -vva'
	git config --global alias.go          'checkout'
	git config --global alias.new         'checkout -b'


# INSTALL
# installs dotfiles to the current user's home folder

.PHONY: install
install: git
	for file in $(DOTFILES); do cp -f dotfiles/$$file.* ~/.$$file; done
	mkdir -p ~/.config/nvim && cp -f ~/.vimrc ~/.config/nvim/init.vim


# UNINSTALL
# uninstalls dotfiles present in the current version of strap

.PHONY: uninstall
uninstall:
	for file in $(DOTFILES); do rm -f ~/.$$file; done
	rm -f ~/.config/nvim/init.vim


# DOCTOR
# checks current install for things that might break it

.PHONY: doctor
doctor:
	test ! -f ~/.bash_profile
	test ! -f ~/.bash_login


# DEVELOP
# configures the development environment, including editors, terminal, etc

.PHONY: develop
develop:
	# TERMINALS
	mkdir -p ~/.config/kitty
	cp -f develop/kitty.conf ~/.config/kitty/kitty.conf
	# NEOVIM
	mkdir -p ~/.config/nvim/autoload
	curl -fsSLo ~/.config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	command -v nvim > /dev/null && nvim +PlugInstall +qall
	# VSCODE (TODO macOS specific)
	mkdir -p ~/Library/Application\ Support/Code/User/
	cp -f develop/vscode.json ~/Library/Application\ Support/Code/User/settings.json


# STANDALONE PACKAGES
# manually installed packages and files

.PHONY: homebrew
homebrew:
	@test "$$(uname -s)" = Darwin
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew tap homebrew/bundle

.PHONY: nix
nix:
	curl -fsSL https://nixos.org/nix/install | sh

.PHONY: rust
rust:
	curl -fsSL https://sh.rustup.rs | sh -s -- -y


# MANAGED PACKAGES
# managed package and bundle installs

.PHONY: brew
brew:
	@test "$$(uname -s)" = Darwin
	mkdir -p /tmp/strap
	cp bundles/brewfile.rb /tmp/strap/Brewfile
	cd /tmp/strap && brew bundle
	rm -rf /tmp/strap && brew cleanup

.PHONY: pip
pip:
	@command -v pip3 > /dev/null
	sudo pip3 install --upgrade pip
	sudo pip3 install -r bundles/pipfile.txt


# SYSTEM CONFIG
# system tweaking and configuring recipes

.PHONY: macos
macos:
	@test "$$(uname -s)" = Darwin
	# TYPING & KEYBOARD
	defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
	defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
	defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
	defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
	defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
	defaults write NSGlobalDomain KeyRepeat -int 0
	# DESKTOP ENVIRONMENT
	defaults write com.apple.dock mru-spaces -bool false
	defaults write com.apple.dock workspaces-auto-swoosh -bool false
	defaults write com.apple.dock autohide -bool true
	defaults write com.apple.dock autohide-delay -float 0
	defaults write com.apple.dock minimize-to-application -bool true
	defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false
	# FINDER
	defaults write NSGlobalDomain AppleShowAllExtensions -bool true
	defaults write com.apple.finder QLEnableTextSelection -bool true
	defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
	defaults write NSGlobalDomain com.apple.springing.enabled -bool true
	defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
	# RESTART MODIFIED PROCESSES
	killall Finder
	killall Dock
	killall SystemUIServer

.PHONY: rtile
rtile:
	@test "$$(uname -s)" = Darwin
	defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'
	killall Dock

.PHONY: ltile
ltile:
	@test "$$(uname -s)" = Darwin
	defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
	killall Dock

