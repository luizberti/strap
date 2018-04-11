all: install

clean:
	rm -rf /tmp/strap

install:
	mkdir -p ~/.config/nvim/
	mkdir -p ~/.config/fish/functions/
	cp -f dotfiles/aliases.sh     ~/.aliases
	cp -f dotfiles/posixrc.sh     ~/.bashrc
	cp -f dotfiles/posixrc.sh     ~/.kshrc
	cp -f dotfiles/gitconfig.ini  ~/.gitconfig
	cp -f dotfiles/gitignore.txt  ~/.gitignore
	cp -f dotfiles/tmux.conf      ~/.tmux.conf
	cp -f dotfiles/vimrc.vim      ~/.vimrc
	printf '. .aliases\n. .kshrc\n'            > ~/.profile
	printf 'source .aliases\nsource .bashrc\n' > ~/.bash_profile

uninstall:
	rm -rf ~/.config/nvim/
	rm -rf ~/.config/fish/
	rm -f  ~/.aliases
	rm -f  ~/.bashrc
	rm -f  ~/.kshrc
	rm -f  ~/.gitconfig
	rm -f  ~/.gitignore
	rm -f  ~/.tmux.conf
	rm -f  ~/.vimrc
	rm -f  ~/.profile
	rm -f  ~/.bash_profile


############
# PACKAGES #
############

homebrew:
	@test $$(uname -s) == 'Darwin'
	xcode-select --install || true
	@read -p "Press ENTER once CLI Tools have been installed: "
	@read -p "Sure? [ENTER] "
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew tap homebrew/bundle

nix:
	curl https://nixos.org/nix/install | sh

rust:
	curl -sSf https://sh.rustup.rs | sh

oksh:
	mkdir -p /tmp/strap
	wget -O /tmp/strap/oksh.tar.gz https://github.com/ibara/oksh/archive/OpenBSD-6.3.tar.gz
	mkdir -p /tmp/strap/oksh && tar -xvf /tmp/strap/oksh.tar.gz -C /tmp/strap/oksh --strip-components 1
	cd /tmp/strap/oksh && ./configure && make
	@read -p "ENTER to install oksh (you need sudo), or ^C to abort this step:"
	cd /tmp/strap/oksh && sudo make install
	sudo echo $$(which oksh) >> /etc/shells


###########
# MANAGED #
###########

brew:
	@test $$(uname -s) == 'Darwin'
	mkdir -p /tmp/strap
	cp bundles/brewfile.rb /tmp/strap/Brewfile
	cd /tmp/strap && brew bundle && brew cleanup && brew cask cleanup

pip:
	sudo pip3 install --upgrade pip
	sudo pip3 install -r bundles/pipfile.txt

editors:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +PlugInstall +qall
	nvim +PlugInstall +qall
	-git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d


##########
# EXTRAS #
##########

sysconf:
	@test $$(uname -s) == 'Darwin'
	sh settings/system.sh
	@echo "Remember to set a hostname in System Preferences..."
	@echo "Remember to customize energy saving settings in System Preferences..."

rtile:
	@test $$(uname -s) == 'Darwin'
	defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'
	killall Dock

ltile:
	@test $$(uname -s) == 'Darwin'
	defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
	killall Dock
