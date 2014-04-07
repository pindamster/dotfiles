syntax on

set laststatus=2  " Display status bar always
" spiiph's
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
set statusline+=%-40f\                    " path
set statusline+=%=%1*%y%*%*\              " file type
set statusline+=%10((%l,%c)%)\            " line and column
set statusline+=%P                        " percentage of file

set nu      "Activate line numbers"

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
endif
