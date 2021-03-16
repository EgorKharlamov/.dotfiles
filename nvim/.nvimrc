" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

Plug 'luochen1990/rainbow' " brackets pair colorizer
Plug 'kaicataldo/material.vim', { 'branch': 'main' } " color scheme
Plug 'tpope/vim-surround' " all about surround :)

""" js/ts dev 
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " this is for auto complete, prettier and tslinting

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']  " list of CoC extensions needed

Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {

" these two plugins will add highlighting and indenting to JSX and TSX files.
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

" documentation
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

let g:rainbow_active = 1
syntax enable
if (has('termguicolors'))
  set termguicolors
endif
let g:material_terminal_italics = 1
let g:material_theme_style = 'ocean'
colorscheme material


" map
source $HOME/.config/nvim/.mapnvimrc

" set
source $HOME/.config/nvim/.settingsnvimrc

