call plug#begin(stdpath('data') . '/plugged')
Plug 'luochen1990/rainbow' " brackets pair colorizer
Plug 'kaicataldo/material.vim', { 'branch': 'main' } " color scheme
Plug 'tpope/vim-surround' " all about surround :)
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'} " this is for auto complete, prettier and tslinting
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-emmet', 'coc-cssmodules', 'coc-vetur', 'coc-go', 'coc-sh']  " list of CoC extensions needed
Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'airblade/vim-gitgutter'
Plug 'tomtom/tcomment_vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'tpope/vim-fugitive'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'tmux-plugins/vim-tmux'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
call plug#end()

let g:rainbow_active = 1
syntax enable
if (has('termguicolors'))
  set termguicolors
endif
let g:material_terminal_italics = 1
let g:material_theme_style = 'ocean'
colorscheme material

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" vue files highlighting
let g:vim_vue_plugin_load_full_syntax = 1
let g:vim_vue_plugin_use_scss = 1
let g:vim_vue_plugin_use_sass = 1
let g:vim_vue_plugin_use_typescript = 1
let g:vim_vue_plugin_has_init_indent = 1
let g:vim_vue_plugin_highlight_vue_attr = 1
let g:vim_vue_plugin_highlight_vue_keyword = 1
let g:vim_vue_plugin_use_foldexpr = 1
" let g:vim_vue_plugin_custom_blocks = 1
let g:vim_vue_plugin_debug = 1

" map
source $HOME/.config/nvim/.mapnvimrc

" set
source $HOME/.config/nvim/.settingsnvimrc
