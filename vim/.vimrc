set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
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
