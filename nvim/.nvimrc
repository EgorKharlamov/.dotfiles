call plug#begin(stdpath('data') . '/plugged')
Plug 'luochen1990/rainbow' " brackets pair colorizer
Plug 'kaicataldo/material.vim', { 'branch': 'main' } " color scheme
Plug 'tpope/vim-surround' " all about surround :)
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'} " this is for auto complete, prettier and tslinting
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-emmet', 'coc-cssmodules', 'coc-vetur', 'coc-go', 'coc-sh', 'coc-snippets', 'coc-tailwindcss']  " list of CoC extensions needed
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
Plug 'cometsong/commentframe.vim'
Plug 'preservim/nerdtree'  |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons' |
            \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'govim/govim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mhinz/vim-startify'
Plug 'posva/vim-vue'
" Plug 'storyn26383/vim-vue'

" Markdown
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'godlygeek/tabular'
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

call plug#end()


"------------------------------------------------------------------------------"
"                                      MAP                                     "
"------------------------------------------------------------------------------"
source $HOME/.config/nvim/.mapnvimrc


"------------------------------------------------------------------------------"
"                                      SET                                     "
"------------------------------------------------------------------------------"
source $HOME/.config/nvim/.settingsnvimrc
