export CLICOLOR=1
export LANG='en_US'
export LC_ALL='en_US.UTF-8'
export LC_CTYPE='UTF-8'
export EDITOR='vim'

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$HOME/.cargo/bin:$PATH


if [ -x $(command -v go) ]; then
    export GOROOT=$(go env GOROOT)
    export GOPATH=$(go env GOPATH)
    export GOBIN=$GOPATH/bin
    export PATH=$PATH:$GOBIN
fi


# OS Dependant Configuration
if [ $(uname -s) == 'Darwin' ]; then
    export HOMEBREW_CASK_OPTS='--appdir=/Applications'
elif [ $(uname -s) == 'Linux' ]; then
    export PATH="$HOME/.linuxbrew/bin:$PATH"
    export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
    export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
elif [ $(uname -s) == 'FreeBSD' ]; then :;
elif [ $(uname -s) == 'OpenBSD' ]; then :;
fi

