syntax on

set wildmode=longest,list,full  " for better tab completion
set backspace=2       " Solves annoying behaviour of backspace in newer version
set autoindent        
set expandtab         " Set tab to do real spaces
set tabstop=4         " Interpret tab as 2 colums 
set shiftwidth=4      " Use 2 colums for shift with > or <
set softtabstop=4     " Use 2 colums for tab with TAB
set splitbelow
set splitright
set laststatus=2      " Display status bar always

set number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

set foldmethod=indent
set foldlevel=99

colorscheme atom-dark-256

filetype off      " required for vundle stuff to work
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'dense-analysis/ale' " Linting, Flake8 support
Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy file opening
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
"  Plugin 'paranoida/vim-airlineish'
 " Plugin 'scrooloose/syntastic'
"  Plugin 'taglist.vim'
"  Plugin 'tmux-plugins/vim-tmux-focus-events'
"  Plugin 'christoomey/vim-tmux-navigator'
"  Plugin 'tpope/vim-surround'
"  Plugin 'tpope/vim-repeat'
"  Plugin 'majutsushi/tagbar'
"  Plugin 'chriskempson/base16-vim'
call vundle#end()
filetype plugin indent on

let g:ale_linters = {'python' : ['flake8']}

"" Taglist
set tags=./tags;/

"   "" Fugitive
"   command! Greview :Git! diff --staged

"   nnoremap <leader>gr :Greview<cr>
"   "" Syntastic
"   " set statusline+=%#warningmsg#
"   " set statusline+=%{SyntasticStatuslineFlag()}
"   " set statusline+=%*
" 
"   " let g:syntastic_always_populate_loc_list = 1
"   " let g:syntastic_auto_loc_list = 1
"   " let g:syntastic_check_on_open = 1
"   " let g:syntastic_check_on_wq = 1
"   " let g:syntastic_enable_signs = 1
"   " let g:syntastic_cpp_checkers=['clang_check']
" 
"" CtrlP
let g:ctrlp_follow_symlinks = 0
" 
"" Airline
let g:airline_theme = 'angr'
let g:airline_powerline_fonts = 1

" 
" Remappings
"" Unmap the arrow keys
noremap <down> <Nop>
noremap <left> <Nop>
noremap <right> <Nop>
noremap <up> <Nop>
 
noremap! <down> <Nop>
noremap! <left> <Nop>
noremap! <right> <Nop>
noremap! <up> <Nop>
" 
"   nnoremap <Tab> <Esc>
"   vnoremap <Tab> <Esc>gV
"   onoremap <Tab> <Esc>
"   inoremap <Tab> <Esc>`^
"   inoremap <Leader><Tab> <Tab>
" 
" function! Switchnu()
"   set nornu
"   set nu
"   endfunc
" 
" function! Switchrnu()
"   set nonu
"   set rnu
"   endfunc
" 
"   function! NumberToggle()
"   if(&relativenumber == 1)
" call Switchnu()
"   else
" call Switchrnu()
"   endif
"   endfunc
"   nnoremap <C-n> :call NumberToggle()<cr>
"   autocmd InsertEnter * :call Switchnu()
"   autocmd InsertLeave * :call Switchrnu()
"   au FocusLost * :call Switchnu()
"   au FocusGained * :call Switchrnu()
" 
" function! SetBackground()
"   if $TMUX != ""
"   let g:backthemeenv=substitute(substitute(system("tmux showenv -g THEME_BACKGROUND"), "\n", "", "g"), "THEME_BACKGROUND=", "", "g")
"   else
"   let g:backthemeenv=$THEME_BACKGROUND
"   endif
"   if g:backthemeenv == "light"
"   set background=light
"   elseif g:backthemeenv == "dark"
"   set background=dark
"   else
"   echo "g:backthemeenv is not set - make sure scripts are correct"
"   endif
"   if exists(':AirlineRefresh')
"   AirlineRefresh
"   endif
"   endfunc
" call SetBackground()
"   au FocusGained * :call SetBackground()
" 
"   "" Convinient window navigation via hjkl
"   " nnoremap <C-h> <C-w>h
"   " nnoremap <C-j> <C-w>j
"   " nnoremap <C-k> <C-w>k
"   " nnoremap <C-l> <C-w>l
" 
"   "" Keep selection when indenting a block
"   vnoremap < <gv2h
"   vnoremap > >gv2l
" 
" if bufwinnr(1)
"   nnoremap + <C-W>+
"   nnoremap - <C-W>-
"   nnoremap > <C-W>>
"   nnoremap < <C-W><
"   endif
" 
"   "" Leader Mappings
"   let mapleader = ','
"   """ Buffer navigation
"   nnoremap <Leader>b :bp<CR>
"   nnoremap <Leader>f :bn<CR>
"   nnoremap <Leader>t :tabnew %<CR>
" 
"   map <F8> :TagbarToggle<CR>
"   nnoremap <Leader>o :CtrlPMixed<CR>
" 
"   " Ugly fix
"   highlight LineNr ctermfg=grey ctermbg=black
"   " hi clear LineNr
"   hi clear CursorLineNr
