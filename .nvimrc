" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

Plug 'luochen1990/rainbow'
Plug 'tomasiser/vim-code-dark'

call plug#end()

let g:rainbow_active = 1
syntax enable
colorscheme codedark

inoremap jk <ESC>

noremap <space>y "*y
noremap <space>Y "*Y
noremap <space>p "*p
noremap <space>P "*P

set relativenumber

set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set termguicolors
set expandtab
set hlsearch
set ignorecase smartcase
set showmode
set numberwidth=1

