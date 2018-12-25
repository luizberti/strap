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


# INSTALL
# installs dotfiles to the current user's home folder

.PHONY: install
install:
	sudo mkdir -p /etc/profile.d && sudo cp -f profile.d/* /etc/profile.d/
	echo 'for f in /etc/profile.d/*.sh; do . $$f; done' | sudo tee /etc/profile > /dev/null
	for file in $(DOTFILES); do cp -f dotfiles/$$file.* ~/.$$file; done


# UNINSTALL
# uninstalls dotfiles present in the current version of strap

.PHONY: uninstall
uninstall:
	for file in $(PROFILE); do rm -f /etc/profile.d/$$file; done
	for file in $(DOTFILES); do rm -f ~/.$$file; done


# DOCTOR
# checks current install for things that might break it

.PHONY: doctor
doctor:
	test ! -f ~/.bash_profile
	test ! -f ~/.bash_login
	test -d /etc/profile.d


# DEVELOP
# configures the development environment, including editors, terminal, etc

.PHONY: develop
develop:
	# TERMINALS
	cp -f development/kitty.conf ~/.config/kitty/kitty.conf
	# VIM and NVIM
	mkdir -p ~/.vim/autoload ~/.config/nvim/autoload
	curl -fsSLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	cp -f ~/.vim/autoload/plug.vim ~/.config/nvim/autoload/plug.vim
	command -v vim  > /dev/null && vim  +PlugInstall +qall
	command -v nvim > /dev/null && nvim +PlugInstall +qall
	# EMACS and SPACEMACS
	test -d ~/.emacs.d || command -v git > /dev/null
	test -d ~/.emacs.d || git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
	git -C ~/.emacs.d pull
	# VSCODE
	cp -f development/vscode.json ~/Library/Application\ Support/Code/User/settings.json  # TODO macOS specific


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

