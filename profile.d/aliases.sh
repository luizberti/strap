alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias ll='ls -l'
alias lsa='ls -A'
alias lla='ls -lA'
alias tra="tree -a -F -I '.git|.hg|.DS_Store|.sass-cache'"
alias tre='tree --dirsfirst -F'

alias gs='git status'
alias tiga='tig --all'

[ -x "$(command -v nvim)" ] && alias vim='nvim'
[ -x "$(command -v nvim)" ] && alias vimdiff='nvim -d'
alias ccat='pygmentize -O style=monokai -f console256 -g'

