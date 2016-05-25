" NeoVim Config
" #############

" Auto Reload Config on Change
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END


" Plugin Manager
" ##############

" Installs vim-plug if it's not currently there
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
"Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } | Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }

call plug#end()


" Plugins
" #######

map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" Interface
" #########

" Hybrid Line Numbers
set number
set relativenumber
hi CursorLineNR ctermfg=yellow

syntax on
set title
set ruler
highlight clear SignColumn


" Functionality
" #############

set hls!
set showmatch
set matchtime=0
set smartcase
set hidden

" Ignore Patterns
set wildignore=*.swp,*.bak,*.pyc,*.class,.sass_cache,__pycache__,.DS_Store,.git
set wildignore+=*.o,*.so

" Tabulation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Better Commands
nnoremap ; :
inoremap jj <esc>
inoremap kk <esc>
inoremap jk <esc>
inoremap kj <esc>

" Function Keys
nnoremap <F12> :set hls!<CR>
set pastetoggle=<F2>

