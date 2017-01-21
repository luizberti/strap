# Taps
######

cask_args appdir: '/Applications'
tap 'caskroom/cask'
tap 'caskroom/fonts'

# Official
tap 'homebrew/dupes'     # duplicates of system binaries
tap 'homebrew/versions'  # versioned formulas
tap 'homebrew/science'   # scientific use formulas
tap 'homebrew/python'    # python formulas (use --with-python3)
#tap 'homebrew/completions'  # formulas that add autocompletion to shell commands

# 3rd Party
tap 'neovim/neovim'
tap 'posva/taps'     # for catimg (needs imagemagick)


# Brews
#######

# Basics
brew 'gcc', args: ['with-jit', 'without-multilib']  # multilib causes problems on OpenMP
brew 'git'
brew 'grep'
brew 'pkg-config'
brew 'coreutils'
brew 'findutils'
brew 'binutils'
brew 'gnu-time'  # [NOTE] invoke with `gtime`

# Shells
brew 'bash'
brew 'dash'
brew 'fish'

# Langs
brew 'nasm'
brew 'python'
brew 'python3'
brew 'pypy'
brew 'pypy3'
brew 'lua'
brew 'lua51'
brew 'lua53'
brew 'luajit'
#brew 'luarocks'
#brew 'luvit'
brew 'node'
# [TODO] add julia and racket (maybe common-lisp, haskell, rust and go as well)

# Libraries
brew 'sdl'
brew 'sdl2'
brew 'zlib'
brew 'nacl'
brew 'libsodium'
brew 'libressl'
brew 'libmill'
brew 'libuv'
brew 'jemalloc'
brew 'ncurses'
brew 'hiredis'

# Lang Tools
brew 'gdb'
brew 'creduce'
brew 'radare2'
brew 'valgrind'
brew 'gcore'

# Dev Tools
brew 'ag'
brew 'ack'
brew 'tig'
brew 'hub'
brew 'doctl'
brew 'heroku'
brew 'git-cola'
brew 'git-plus'
brew 'git-lfs'
brew 'vim', args: ['with-python3', 'with-lua', 'with-luajit']
brew 'neovim'
brew 'sqlite'
brew 'redis', restart_service: false
brew 'vegeta'
#brew 'gor'
#brew 'vault'

# CLI Tools
brew 'xz'
brew 'tmux'
brew 'htop'
brew 'trash'
brew 'rename'
brew 'tree'
brew 'curl'
brew 'wget'
brew 'nmap'  # [NOTE] comes with ncat
brew 'socat'
brew 'netcat'
brew 'netcat6'
brew 'ngrep'
brew 'pdfgrep'
brew 'archey'
brew 'ranger'
brew 'p7zip'
brew 'unrar'
brew 'moreutils'
brew 'signify-osx'

#brew 'keybase'
brew 'tarsnap'
brew 'gdrive'
brew 'mackup'
brew 'mas'
brew 'youtube-dl'
brew 'sshuttle'
brew 'thefuck'  # [NOTE] needs a shell add-on as well

brew 'ffmpeg', args: ['with-tools', 'with-xz']
brew 'imagemagick'
brew 'potrace'
brew 'webp'
brew 'catimg'


# Casks
#######

# Basics
cask 'google-chrome'
cask 'firefox'
cask 'transmission'
cask 'spotify'
cask 'whatsapp'
cask 'vlc'

# Utilities
cask 'appcleaner'
cask 'bartender'
cask 'moom'
cask 'colorpicker-skalacolor'
cask 'airtable'
cask 'notion'
#cask 'handbrake'

# Designer
cask 'sketch'
cask 'blender'

# Developer
cask 'dash'
cask 'atom'
cask 'sublime-text'
cask 'visual-studio-code'
cask 'codekit'
cask 'transmit'
cask 'virtualbox'
cask 'vagrant'
cask 'iterm2'

# QuickLook Plugins
cask 'quicklook-json'
cask 'qlimagesize'
cask 'webpquicklook'
cask 'qlvideo'
cask 'suspicious-package'

# Fonts
cask 'font-fenix'
cask 'font-fauna-one'
cask 'font-orienta'
cask 'font-clear-sans'
cask 'font-fira-sans'
cask 'font-fira-mono'
cask 'font-fira-code'
cask 'font-source-code-pro'
cask 'font-inconsolata-dz'
cask 'font-m-plus'


# Mac App Store
###############

# Basics
mas 'Radium', id: 597611879
mas 'Ulysses', id: 623795237
mas 'Pages', id: 409201541
mas 'Clear', id: 504544917
mas 'Slack', id: 803453959
mas 'Telegram', id: 747648890
mas 'Quiver', id: 866773894

# Utilities
mas 'The Unarchiver', id: 425424353
mas 'Caffeine', id: 411246225
mas 'PopClip', id: 445189367
mas 'Calcbot', id: 931657367
mas '1Password', id: 443987910
mas 'Jumpshare', id: 889922906

# Developer
mas 'Haskell', id: 841285201
mas 'Kaleidoscope', id: 587512244
cask 'ksdiff'

# Designer
mas 'Affinity Designer', id: 824171161
mas 'Pixelmator', id: 407963104
mas 'Acorn', id: 1019272813
mas 'Mischief', id: 928430260
#mas 'xScope', id: 889428659

