syntax on

"set mouse=a

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/ctrlp.vim
call vundle#rc()
Plugin 'gmarik/vundle'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'paranoida/vim-airlineish'
Plugin 'taglist.vim'
Plugin 'tmux-plugins/vim-tmux-focus-events'
" Plugin 'scrooloose/nerdtree'

let mapleader = ','

" map <C-n> :NERDTreeToggle<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_theme = 'airlineish'
let g:airline_powerline_fonts = 1

set laststatus=2  " Display status bar always

set cursorline
set relativenumber      "Activate line numbers"

function! Switchnu()
    set nornu
    set nu
endfunc

function! Switchrnu()
    set nonu
    set rnu
endfunc

function! NumberToggle()
  if(&relativenumber == 1)
    call Switchnu()
  else
    call Switchrnu()
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

autocmd InsertEnter * :call Switchnu()
autocmd InsertLeave * :call Switchrnu()
au FocusLost * :call Switchnu()
au FocusGained * :call Switchrnu()

" Unmap the arrow keys
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>

ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

set expandtab         " Set tab to do real spaces
set tabstop=2         " Interpret tab as 2 colums 
set shiftwidth=2      " Use 2 colums for shift with > or <
set softtabstop=2     " Use 2 colums for tab with TAB

set splitbelow
set splitright

" Buffer navigation
nnoremap <Leader>b :ls<CR>:b<Space>
nnoremap <Leader>t :tabnew %<CR>
nnoremap <Leader>o :CtrlPMixed<CR>

" Window navigation via hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Keep selection when indenting a block
vnoremap < <gv2h
vnoremap > >gv2l

" Use 256 color schemes
set t_Co=256

" Use the 256 optimized molokai scheme
let g:rehash256 = 1
color molokai
set background=dark

" Map tab using to control hjkl
map <up> :tabr<cr>
map <down> :tabl<cr>

" Read tags file
set tags=./tags;/

filetype plugin on

if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
  map > <C-W>>
  map < <C-W><
endif


" for better tab completion
set wildmode=longest,list,full
set wildmenu

" Solves annoying behaviour of backspace in newer version
set backspace=2
set autoindent
