set nocompatible
set number
set ruler
set title
syntax on
hi Visual cterm=NONE ctermbg=White ctermfg=Black
highlight clear SignColumn

set incsearch
set hlsearch
set showmatch
set smartcase
set backspace=indent,eol,start
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class,.sass_cache,__pycache__,.DS_Store,.git
set wildignore+=*.o,*.so,*.rdb,*.aof,*.jar

set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set autoindent

autocmd FileType make setlocal noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

nnoremap ; :
set pastetoggle=<F2>

