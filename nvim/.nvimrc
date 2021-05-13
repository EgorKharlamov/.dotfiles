call plug#begin(stdpath('data') . '/plugged')
Plug 'luochen1990/rainbow' " brackets pair colorizer

Plug 'kaicataldo/material.vim', { 'branch': 'main' } " color scheme
Plug 'mhartington/oceanic-next'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

Plug 'tpope/vim-surround' " all about surround :)
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'} " this is for auto complete, prettier and tslinting
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-emmet', 'coc-cssmodules', 'coc-vetur', 'coc-go', 'coc-sh', 'coc-snippets', 'coc-tailwindcss']  " list of CoC extensions needed
Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {
" Plug 'yuezk/vim-js'
" Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
" Plug 'dense-analysis/ale'
Plug 'digitaltoad/vim-pug'
Plug 'jparise/vim-graphql'

Plug 'HerringtonDarkholme/yats.vim'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'airblade/vim-gitgutter'
Plug 'tomtom/tcomment_vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'caenrique/nvim-maximize-window-toggle'

Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'

Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'tmux-plugins/vim-tmux'
Plug 'cometsong/commentframe.vim'
Plug 'preservim/nerdtree'  |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'govim/govim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mhinz/vim-startify'
" Plug 'posva/vim-vue'
Plug 'leafOfTree/vim-vue-plugin'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'p00f/nvim-ts-rainbow'

" Plug 'metakirby5/codi.vim'
" Plug 'storyn26383/vim-vue'
Plug 'ThePrimeagen/vim-be-good'

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
Plug 'ryanoasis/vim-devicons'
call plug#end()




"------------------------------------------------------------------------------"
"                                      MAP                                     "
"------------------------------------------------------------------------------"
source $HOME/.config/nvim/.mapnvimrc


"------------------------------------------------------------------------------"
"                                      SET                                     "
"------------------------------------------------------------------------------"
source $HOME/.config/nvim/.settingsnvimrc


lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
  },
  indent = {
    enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = true },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
  },
  navigation = {
    enable = true,
    keymaps = {
      goto_definition = "gnd",
      list_definitions = "gnD",
      list_definitions_toc = "gO",
      goto_next_usage = "<a-*>",
      goto_previous_usage = "<a-#>",
    },
  },
}
EOF
