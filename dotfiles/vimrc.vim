set nocompatible

" Interface
set nu
set ruler
hi Visual cterm=NONE ctermbg=White ctermfg=Black
highlight clear SignColumn

" Functionality
syntax on
set incsearch
set hlsearch
set showmatch
set smartcase
set backspace=indent,eol,start
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class,*.rdb,*.aof
set title

" :w! Will Force File to Save
cmap w!! w !sudo tee % >/dev/null

" Tabulation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set autoindent

" Restore Cursor Position to Before Jump
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif


" Smoother Commanding and Exit to Normal Mode
nnoremap ; :
inoremap jj <esc>

" Map <esc> to clear search highlights on normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[

" Toggle Paste Mode on <F2>
set pastetoggle=<F2>

" Pointer Operator Shortcut
inoremap <C-L> <space>-><space>

