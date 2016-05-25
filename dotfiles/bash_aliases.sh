# Aliases
#########

# macOS Specific
osname=$(uname -s)
if [ "$osname" == "Darwin" ]; then
	alias subl="open -a Sublime\ Text"
fi


# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias lsa="ls -A"
alias tra="tree -a -F -I '.git|.hg|.DS_Store|.sass-cache'"
alias tree="tree --dirsfirst -F"


# Utils
alias pubip="dig +short myip.opendns.com @resolver1.opendns.com"
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
alias servedir="sudo python -m SimpleHTTPServer"
alias ccat="pygmentize -O style=monokai -f console256 -g"


# Git
alias gs="git status"
alias ungit="rm -rf ./.git/"

