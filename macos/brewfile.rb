# Taps & Args
#############

cask_args appdir: '/Applications'
tap 'caskroom/cask'
tap 'caskroom/fonts'
tap 'homebrew/science'
tap 'homebrew/services'


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
# [TODO] add julia, racket, common-lisp, rust, scala, and go

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
cask 'whatsapp'
cask 'gitter'
cask 'transmission'
cask 'spotify'
cask 'vlc'
cask 'geogebra'

# Utilities
cask 'moom'
cask 'bartender'
cask 'appcleaner'
cask 'etcher'
cask 'calibre'
cask 'colorpicker-skalacolor'
cask 'razer-synapse'
cask 'logitech-options'
cask 'wacom-intuos-tablet'

# Design
cask 'sketch'
cask 'blender'

# Development
cask 'dash'
cask 'sublime-text'
cask 'visual-studio-code'
cask 'codekit'
cask 'virtualbox'
cask 'vagrant'

# QuickLook Plugins
cask 'qlstephen'
cask 'quicklook-json'
cask 'quicklook-csv'
cask 'qlimagesize'
cask 'webpquicklook'
cask 'qlvideo'
cask 'suspicious-package'
cask 'betterzipql'

# Programming Fonts
cask 'font-fira-mono'
cask 'font-fira-code'
cask 'font-source-code-pro'
cask 'font-inconsolata-dz'
cask 'font-m-plus'

# Design Fonts
# TODO


# Mac App Store
###############

# Basics
mas '1Password', id: 443987910
mas 'Telegram', id: 747648890
mas 'Slack', id: 803453959
mas 'Clear', id: 504544917
mas 'Pages', id: 409201541
mas 'Ulysses', id: 623795237

# Utilities
mas 'Caffeine', id: 411246225
mas 'PopClip', id: 445189367
mas 'Jumpshare', id: 889922906
mas 'The Unarchiver', id: 425424353
mas 'Kaleidoscope', id: 587512244
cask 'ksdiff'

# Design
mas 'Drop', id: 1173932628
mas 'Affinity Designer', id: 824171161
mas 'Pixelmator', id: 407963104
mas 'Acorn', id: 1019272813
mas 'Mischief', id: 928430260
