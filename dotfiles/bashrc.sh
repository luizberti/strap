# Bash RC
#########

# Environment Variables
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

export EDITOR="vim"
export CLICOLOR=1
export LESS=-RFX

export CC="gcc"
export CXX="g++"
export CFLAGS="-march=native -pipe -std=c11 -pedantic -Wall -Wextra"
export CXXFLAGS=""
export ARCHFLAGS="-arch x86_64"
export GOPATH="$HOME/go"


# OS Specific
osname=$(uname -s)
if [ "$osname" == "Darwin" ]; then
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"
    export PATH="/usr/local/bin:$PATH"
else
    export PATH="$HOME/.linuxbrew/bin:$PATH"
    export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
    export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
fi

