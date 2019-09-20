#!/bin/bash

# SHELL ENVIRONMENT
export LANG=en_US LC_ALL=en_US.UTF-8 LC_CTYPE=UTF-8
export CLICOLOR=1 EDITOR=vim
shopt -s globstar extglob
PS1='\e[0;36m\t  \e[38;5;204m\u\e[38;5;242m@\e[38;5;212m\h.local  \e[33m\w\e[38;5;121m$PROMPT_GIT\e[31m$PROMPT_EXIT\e[38;5;75m$PROMPT_ELAPSED\e[0m\n\$ '
HISTSIZE=1000
HISTFILESIZE=10000
HISTCONTROL=ignoredups:ignorespace
HISTTIMEFORMAT='%s  '
PROMPT_COMMAND="$(cat <<EOF
PROMPT_EXIT=\$?
test \$PROMPT_EXIT -eq 0 && unset PROMPT_EXIT || PROMPT_EXIT="  ⌦ \$PROMPT_EXIT"

# HISTCONTROL=ignoredups MAY SCREW WITH THIS TIMER
PROMPT_ELAPSED=\$[\$(date +%s)-\$(history 1 | awk 'NR==1 {print \$2}')]
test \$PROMPT_ELAPSED -lt 8 && unset PROMPT_ELAPSED || PROMPT_ELAPSED="  Δ \${PROMPT_ELAPSED}s"

# ROOT COLOR

# GIT INTEGRATION
PROMPT_GIT="  \$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
if test \$? -eq 0; then
    :
else
    unset PROMPT_GIT
fi
EOF
)"

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
alias ls='exa --group-directories-first'
alias la='exa --all --group-directories-first'
alias ll='exa --long --git --time-style=long-iso --group-directories-first'
alias lla='ll --all'
alias tre='exa --all --classify --tree --group-directories-first --ignore-glob=.git'
alias tree='tre --long --git --time-style=long-iso'

# TOOL ALIASES
alias g=git
[ -x "$(command -v nvim)" ] && alias vim='nvim'
[ -x "$(command -v nvim)" ] && alias vimdiff='nvim -d'
alias ccat='pygmentize -O style=monokai -f console256 -g'
alias fzfh='cat $HOME/.bash_history | fzf --tac --sync --tiebreak=index | pbcopy'

