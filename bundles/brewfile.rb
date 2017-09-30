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

# Low Level Tooling
brew 'nasm'
brew 'gdb'
brew 'radare2'
brew 'valgrind'
brew 'gcore'

# Shells
brew 'bash'
brew 'dash'
brew 'fish'

# GNU Dupes
brew 'grep'
brew 'coreutils'
brew 'findutils'
brew 'binutils'
brew 'gnu-time'
brew 'gawk'

# Langs
brew 'python'
brew 'python3'
brew 'pypy'
brew 'pypy3'
brew 'lua@5.1'
brew 'lua@5.3'
brew 'luajit'
cask 'julia'
cask 'racket'
brew 'clozure-cl'
brew 'sbcl'
cask 'java'  # for Clojure, Scala, Kafka, Spark, Cassandra, etc
brew 'leiningen'  # Clojure in disguise
brew 'scala'
brew 'sbt'
brew 'rust', args: ['with-racer']


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
brew 'tarsnap'
brew 'pstree'
brew 'pdfgrep'
brew 'entr'
cask 'ngrok'  # TODO seek alternative (ultrahool, localtunnel, localhost.run, frp)
# TODO maybe webfs?

# Terminal Applications
brew 'trash'
brew 'tree'
brew 'ranger'
brew 'htop'
brew 'tmux'
brew 'tig'
brew 'git-plus'
brew 'git-lfs'
brew 'neovim'
brew 'vim', args: ['with-python3', 'with-lua', 'with-luajit']

# Networking
brew 'curl'
brew 'wget'
brew 'nmap'
brew 'socat'
brew 'netcat'
brew 'netcat6'
brew 'ngrep'
brew 'tcpdump'
brew 'gor'
brew 'wrk'
brew 'vegeta'

# Infrastructure Management
brew 's3cmd'
brew 'doctl'
brew 'heroku'
brew 'vault'
brew 'terraform'
brew 'packer'
brew 'docker'
# TODO maybe kubernetes, mesos, swarm, marathon, flintrock, etc?

# Backends
brew 'sqlite'
brew 'redis', restart_service: false
brew 'kafka', restart_service: false
brew 'cassandra'
brew 'apache-spark'
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
brew 'youtube-dl'
brew 'archey'


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
