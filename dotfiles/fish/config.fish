# Fish Configuration
####################

# Shell
set -x CLICOLOR 1
set --erase fish_greeting

# Environment
set -x LANG   "en_US"
set -x LC_ALL "en_US.UTF-8"
set -x EDITOR "vim"
set -x LESS   "-RFX"
set -x DOCKER_HIDE_LEGACY_COMMANDS "1"

# Language
set -x CC        "gcc"
set -x CXX       "g++"
set -x CFLAGS    "-march=native -pipe -std=c11 -pedantic -Wall -Wextra"
set -x CXXFLAGS  ""
set -x ARCHFLAGS "-arch x86_64"
set -x GOPATH    (string join '' $HOME /golang/)

# Navigation
alias ...  "cd ../../"
alias .... "cd ../../../"

# Development
alias gpp   "g++"
alias gs    "git status"
alias tiga  "tig --all"
alias ungit "rm -rf ./.git/"

# Better Flags
alias lsa     "ls -A"
alias tra     "tree --dirsfirst -a -F -I '.git|.hg|.DS_Store|.sass-cache|node_modules'"
alias tree    "tree --dirsfirst -F -I '__pycache__|node_modules'"
alias duh     "du -hc"
alias hexdump "hexdump -C"
alias crontab "crontab -i"

# Utilities
alias pubip    "dig +short myip.opendns.com @resolver1.opendns.com"
alias sniff    "sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump "sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias servedir "sudo python -m SimpleHTTPServer"
alias ccat     "pygmentize -O style=monokai -f console256 -g"
alias linesubt "grep -Fxvf"
alias venv3    "python3 -m venv"


# OS Specific
if [ (uname) = "Darwin" ]
    set -x PATH /usr/local/bin $PATH
    set -x HOMEBREW_CASK_OPTS "--appdir=/Applications"

    function toggledesk --description="Toggles the display of items in the Desktop."
        set --local state (defaults read com.apple.finder CreateDesktop)
        if [ $state = "true" ]
            defaults write com.apple.finder CreateDesktop false ;and killall Finder
        else
            defaults write com.apple.finder CreateDesktop true ;and killall Finder
        end
    end
else
    set -x PATH     ~/.linuxbrew/bin        $PATH
    set -x MANPATH  ~/.linuxbrew/share/man  $MANPATH
    set -x INFOPATH ~/.linuxbrew/share/info $INFOPATH
end

