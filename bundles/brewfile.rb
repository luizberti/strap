# Taps & Args
#############

cask_args appdir: '/Applications'
tap 'caskroom/cask'
tap 'caskroom/fonts'
tap 'homebrew/science'
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
brew 'rzip'
brew 'lrzip'
brew 'zpaq'
brew 'p7zip'
brew 'unrar'
brew 'moreutils'
brew 'signify-osx'
brew 'pstree'
brew 'pdfgrep'
brew 'entr'

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
brew 'traefik'

# Terminal Applications
brew 'tarsnap'
brew 'tree'
brew 'ranger'
brew 'fd'
brew 'fzf'
brew 'tokei'
brew 'tig'
brew 'htop'
brew 'tmux'
brew 'reattach-to-user-namespace'  # pbcopy and pasting on tmux
brew 'kryptco/tap/kr'
brew 'git-plus'
brew 'git-lfs'
cask 'ngrok'  # TODO seek alternative (ultrahool, localtunnel, localhost.run, frp)

# Development
brew 'emacs'
brew 'vim', args: ['with-python3', 'with-lua', 'with-luajit']
brew 'neovim'
brew 'radare2'

# Infrastructure Management
brew 's3cmd'
brew 'doctl'
brew 'heroku'
brew 'vault'
brew 'terraform'

# Backends
brew 'sqlite'
brew 'redis', restart_service: false
brew 'postgresql', args: ['with-python3'], restart_service: false

# Media & Graphics
brew 'ffmpeg', args: ['with-tools', 'with-xz']
brew 'imagemagick'
brew 'potrace'
brew 'pngquant'
brew 'webp'

# Candy
brew 'mas'
brew 'buku'
brew 'jrnl'
brew 'youtube-dl'
brew 'archey'


# Casks
#######

# Basics
cask 'firefox'
cask 'google-chrome'
cask 'transmission'
cask 'vlc'
cask 'spotify'
cask 'gitter'
mas  'Spark', id: 1176895641
mas  'Slack', id: 803453959
mas  'Telegram', id: 747648890
mas  'WhatsApp', id: 1147396723
mas  'Clear', id: 504544917
mas  'Things3', id: 904280696
mas  'iA Writer', id: 775737590
mas  'Pages', id: 409201541
mas  '1Password', id: 443987910
mas  'Jumpshare', id: 889922906

# Utilities
cask 'moom'
cask 'bartender'
cask 'alfred'
cask 'appcleaner'
cask 'etcher'
cask 'calibre'
cask 'geogebra'
cask 'colorpicker-skalacolor'
mas  'Amphetamine', id: 937984704
mas  'iStat Mini', id: 927292435
mas  'PopClip', id: 445189367
mas  'The Unarchiver', id: 425424353

# Development
cask 'dash'
cask 'sublime-text'
cask 'visual-studio-code'
cask 'codekit'
cask 'insomnia'
cask 'docker'
cask 'ksdiff'
mas  'Kaleidoscope', id: 587512244

# Design
cask 'sketch'
cask 'gimp'
cask 'blender'
mas  'Pixelmator Pro', id: 1289583905
mas  'Mischief', id: 928430260

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
cask 'font-ibm-plex'
