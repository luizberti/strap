#!/bin/bash

# SHELL ENVIRONMENT
export LANG=en_US LC_ALL=en_US.UTF-8 LC_CTYPE=UTF-8
export CLICOLOR=1 EDITOR=vim
shopt -s globstar extglob
PS1='\e[0;36m\t  \e[35m\u@\h  \e[33m\w  \e[31m[$?]\e[0m\n\$ '

# PATH MANGLING
export PATH=$HOME/.cargo/bin:/usr/local/bin:/usr/local/sbin:$PATH
[ -x "$(command -v go)" ] && export PATH="$(go env GOBIN):$PATH"
# TODO nix conda

# OS SPECIFIC
if [ "$(uname -s)" = Darwin ]; then :;
elif [ "$(uname -s)" = Linux ]; then :;  # TODO lsb_release
elif [ "$(uname -s)" = FreeBSD ]; then :;
elif [ "$(uname -s)" = OpenBSD ]; then :;
else echo OS unsupported; fi

# NAVIGATION ALIASES
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ll='ls -l'
alias lsa='ls -A'
alias lla='ls -lA'
alias tra="tree -a -F -I '.git|.hg|.DS_Store|.sass-cache'"
alias tre='tree --dirsfirst -F'

# TOOL ALIASES
alias gs='git status'
alias tiga='tig --all'
[ -x "$(command -v nvim)" ] && alias vim='nvim'
[ -x "$(command -v nvim)" ] && alias vimdiff='nvim -d'
alias ccat='pygmentize -O style=monokai -f console256 -g'

