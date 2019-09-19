cask_args appdir: '/Applications'
tap 'caskroom/cask'
tap 'caskroom/fonts'
tap 'homebrew/services'
brew 'mas'


# BASE SYSTEM
#############

# BUILD AND PACKAGING
brew 'gcc'
brew 'git'
brew 'pkg-config'

# C LIBRARIES
brew 'jemalloc'
brew 'libsodium'
brew 'libressl'
brew 'zlib'
brew 'libuv'

# SHELLS
brew 'bash'
brew 'dash'

# CORE TOOLS
brew 'grep'
brew 'coreutils'
brew 'findutils'
brew 'binutils'
brew 'gnu-time'
brew 'gawk'
brew 'gcore'

# LANGUAGES
brew 'luajit'
brew 'python'
brew 'elixir'
brew 'go'
cask 'julia'
cask 'racket'
cask 'adoptopenjdk'
brew 'clojure'
# TODO add graal?
#brew 'sbcl'
#brew 'clozure-cl'
#brew 'ghc'
#brew 'cabal-install'
#brew 'ocaml'
#brew 'opam'
# TODO add rust


# CLI TOOLS
###########

brew 'ripgrep'
brew 'xsv'
brew 'jq'
brew 'fd'
brew 'fzf'
brew 'bat'
brew 'exa'
brew 'entr'
brew 'zstd'
brew 'htop'
brew 'minisign'
brew 'tarsnap'
brew 'git-lfs'
brew 'tig'

# NETWORKING
brew 'curl'
brew 'wget'
brew 'nmap'
brew 'tcpdump'
brew 'vegeta'
cask 'wireshark'

# DEVELOPMENT
cask 'kitty'
cask 'docker'
cask 'visual-studio-code'
brew 'neovim'

brew 'sqlite'
brew 'redis', restart_service: false


# DESKTOP
#########

cask 'firefox'
cask 'google-chrome'
cask 'transmission'
cask 'spotify'
cask 'vlc'
cask 'alfred'
cask 'vanilla'
cask 'spectacle'
cask 'appcleaner'
cask 'balenaetcher'
mas  'The Unarchiver', id: 425424353

mas  'Spark', id: 1176895641
mas  'Slack', id: 803453959
mas  'Telegram', id: 747648890
mas  'WhatsApp', id: 1147396723

mas  'Things3', id: 904280696
mas  'iA Writer', id: 775737590
mas  'Notability', id: 736189492
mas  '1Password 7', id: 1333542190
mas  'Kaleidoscope', id: 587512244
cask 'ksdiff'
cask 'codekit'
cask 'dash'
cask 'blender'
cask 'sketch'
mas  'Pixelmator Pro', id: 1289583905

cask 'font-fira-mono'
cask 'font-fira-code'
cask 'font-ibm-plex'

