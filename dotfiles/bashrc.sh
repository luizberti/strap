# Bash RC
#########

# Shell
export CLICOLOR=1

# Environment Variables
export LANG="en_US"
export LC_ALL="en_US.UTF-8"
export EDITOR="vim"
export LESS=-RFX

# Language
export CC="gcc"
export CXX="g++"
export CFLAGS="-march=native -pipe -std=c11 -pedantic -Wall -Wextra"
export CXXFLAGS=""
export ARCHFLAGS="-arch x86_64"
export GOPATH="$HOME/golang/"


# OS Specific
osname=$(uname -s)
if [ "$osname" == "Darwin" ]; then
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"
    export PATH="/usr/local/bin:$PATH"
else
    export PATH="$HOME/.linuxbrew/bin:$PATH"
    export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
    export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

    source ~/.bash_profile
fi

