# Taps & Args
#############

cask_args appdir: '/Applications'
tap 'caskroom/cask'
tap 'caskroom/fonts'
tap 'homebrew/services'


# Base Packages
###############

# Base Tools
brew 'gcc'
brew 'git'
brew 'pkg-config'

# C Libraries
brew 'sdl'
brew 'sdl2'
brew 'zlib'
brew 'libsodium'
brew 'libressl'
brew 'libuv'
brew 'jemalloc'
brew 'hiredis'

# Shells
brew 'bash'
brew 'dash'
brew 'fish'

# Core Tools
brew 'grep'
brew 'coreutils'
brew 'findutils'
brew 'binutils'
brew 'gnu-time'
brew 'gawk'
brew 'gcore'

# Langs
brew 'python'
brew 'python@2'
brew 'pypy'
brew 'pypy3'
brew 'lua@5.1'
brew 'lua@5.3'
brew 'luajit'
cask 'julia'
brew 'elixir'
brew 'go'
cask 'racket'
brew 'clozure-cl'
brew 'sbcl'


# Tooling
#########

# Utilities
brew 'ag'
brew 'ripgrep'
brew 'xsv'
brew 'jq'
brew 'xz'
brew 'zstd'
brew 'p7zip'
brew 'unrar'
brew 'moreutils'
brew 'signify-osx'
brew 'pdfgrep'
brew 'tree'
brew 'entr'
brew 'fd'
brew 'fzf'
brew 'htop'
brew 'tmux'
brew 'tig'
brew 'git-plus'
brew 'git-lfs'
brew 'tarsnap'

# Networking
brew 'curl'
brew 'wget'
brew 'nmap'
brew 'socat'
brew 'netcat'
brew 'netcat6'
brew 'ngrep'
brew 'tcpdump'
brew 'wrk'
brew 'vegeta'
brew 'traefik'

# Development
brew 'emacs'
brew 'vim', args: ['with-python3', 'with-lua', 'with-luajit']
brew 'neovim'
brew 'radare2'
brew 'doctl'
brew 'vault'
brew 'terraform'
brew 'sqlite'
brew 'redis', restart_service: false
brew 'postgresql', args: ['with-python3'], restart_service: false

# Candy
brew 'mas'
brew 'buku'
brew 'jrnl'
brew 'youtube-dl'


# Desktop
#########

# Basics
cask 'firefox'
cask 'google-chrome'
cask 'transmission'
cask 'vlc'
cask 'spotify'
mas  'Spark', id: 1176895641
mas  'Slack', id: 803453959
mas  'Telegram', id: 747648890
mas  'WhatsApp', id: 1147396723
mas  'Things3', id: 904280696
mas  'iA Writer', id: 775737590
mas  'Pages', id: 409201541
mas  '1Password 7', id: 1333542190
mas  'Jumpshare', id: 889922906

# Utilities
cask 'moom'
cask 'bartender'
cask 'alfred'
cask 'appcleaner'
cask 'etcher'
cask 'colorpicker-skalacolor'
mas  'Amphetamine', id: 937984704
mas  'iStat Mini', id: 927292435
mas  'PopClip', id: 445189367
mas  'The Unarchiver', id: 425424353

# Development
cask 'kitty'
cask 'dash'
cask 'visual-studio-code'
cask 'codekit'
cask 'insomnia'
cask 'docker'
cask 'ksdiff'
mas  'Kaleidoscope', id: 587512244

# Design
cask 'blender'
cask 'sketch'
mas  'Pixelmator Pro', id: 1289583905

# Fonts
cask 'font-fira-mono'
cask 'font-fira-code'
cask 'font-ibm-plex'

