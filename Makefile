all: brew

############
# MANAGERS #
############

homebrew:
	xcode-select --install || true
	@read -p "Press ENTER once CLI Tools have been installed: "
	@read -p "Sure? [ENTER] "
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew tap homebrew/bundle

nix:
	curl https://nixos.org/nix/install | sh

rust:
	curl -sSf https://sh.rustup.rs | sh


############
# PACKAGES #
############

brew:
	mkdir -p /tmp/strap
	cp bundles/brewfile.rb /tmp/strap/Brewfile
	cd /tmp/strap && brew bundle && brew cleanup && brew cask cleanup

pip:
	sudo pip3 install --upgrade pip
	sudo pip3 install -r bundles/pipfile.txt

pimp:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +PlugInstall +qall
	nvim +PlugInstall +qall
	-git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

dotf:
	mkdir -p ~/.config/fish/functions/
	mkdir -p ~/.config/nvim/
	cp -f dotfiles/bash_aliases.sh  ~/.bash_aliases
	cp -f dotfiles/bash_profile.sh  ~/.bash_profile
	cp -f dotfiles/bash_prompt.sh   ~/.bash_prompt
	cp -f dotfiles/bashrc.sh        ~/.bashrc
	cp -f dotfiles/fish/config.fish ~/.config/fish/config.fish
	cp -f dotfiles/fish/functions/* ~/.config/fish/functions/
	cp -f dotfiles/gitconfig.ini    ~/.gitconfig
	cp -f dotfiles/gitignore.txt    ~/.gitignore
	cp -f dotfiles/tarsnaprc.txt    ~/.tarsnaprc
	cp -f dotfiles/tmux.conf        ~/.tmux.conf
	cp -f dotfiles/editorconfig.ini ~/.editorconfig
	cp -f dotfiles/vimrc.vim        ~/.vimrc
	cp -f dotfiles/nvimrc.vim       ~/.config/nvim/init.vim

oksh:
	mkdir -p /tmp/strap
	wget -O /tmp/strap/oksh.tar.gz https://github.com/ibara/oksh/archive/OpenBSD-6.3.tar.gz
	mkdir -p /tmp/strap/oksh && tar -xvf /tmp/strap/oksh.tar.gz -C /tmp/strap/oksh --strip-components 1
	cd /tmp/strap/oksh && ./configure && make
	@echo "Enter password to install oksh, or ^C to abort this step:"
	-cd /tmp/strap/oksh && sudo make install


############
# CLEANING #
############

clean-dotf:
	rm -f  ~/.bash_aliases
	rm -f  ~/.bash_profile
	rm -f  ~/.bash_prompt
	rm -f  ~/.bashrc
	rm -rf ~/.config/fish/
	rm -f  ~/.gitconfig
	rm -f  ~/.gitignore
	rm -f  ~/.tarsnaprc
	rm -f  ~/.tmux.conf
	rm -f  ~/.editorconfig
	rm -f  ~/.vimrc
	rm -rf ~/.config/nvim/

clean:
	rm -rf /tmp/strap


##########
# EXTRAS #
##########

conf:
	sh settings/system.sh
	@echo "Remember to set a hostname in System Preferences..."
	@echo "Remember to customize energy saving settings in System Preferences..."

rtile:
	defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'
	killall Dock

ltile:
	defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
	killall Dock
