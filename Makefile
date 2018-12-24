DOTFILES=$(shell find dotfiles -type f | awk -F / '{print $$NF}' | cut -d . -f-1)
PROFILE=$(shell find profile.d -type f | awk -F / '{print $$NF}')

all: install checkinstall


# INSTALL
# installs dotfiles to the current user's home folder

.PHONY: install
install:
	sudo mkdir -p /etc/profile.d && sudo cp -f profile.d/* /etc/profile.d/
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
	test -s .bash_profile || rm -f .bash_profile
	test -s .bash_login   || rm -f .bash_login
	@test -f .bash_profile && echo .bash_profile might prevent sourcing .profile
	@test -f .bash_login   && echo .bash_login might prevent sourcing .profile
	@test -d /etc/profile.d || echo no profile.d in /etc/


# DEVELOPMENT
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
	cp -f development/vscode.json ~/Library/Application\ Support/Code/User/settings.json


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
##################

.PHONY: brew
brew:
	@test "$$(uname -s)" = Darwin
	mkdir -p /tmp/strap
	cp bundles/brewfile.rb /tmp/strap/Brewfile
	cd /tmp/strap && brew bundle
	rm -rf /tmp/strap && brew cleanup

.PHONY: pip
pip:
	sudo pip3 install --upgrade pip
	sudo pip3 install -r bundles/pipfile.txt


# SYSTEM CONFIG
###############

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

