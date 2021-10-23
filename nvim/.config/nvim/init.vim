"magic
" - https://github.com/ThePrimeagen/.dotfiles/blob/master/nvim/.config/nvim/init.vim
" - https://gist.github.com/benfrain/4fe3aa3f54101d4565911998218ed724

if &compatible
    set nocompatible               " Be iMproved
endif

let mapleader = " "

" Required: 
filetype plugin indent on

" Only set syntax highlighting once!
if !exists("g:syntax_on")
    syntax enable
endif 


set path+=**

" Menu
set wildmode=longest,list,full
set wildmenu

" ignore files
set wildignore+=**/.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'

Plug 'vim-conf-live/vimconflive2021-colorscheme'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'

" 
Plug 'ambv/black'
Plug 'mbbill/undotree'
Plug 'sbdchd/neoformat'
Plug 'vim-utils/vim-man'
Plug 'tpope/vim-projectionist'
Plug 'junegunn/fzf.vim'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'

" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

Plug 'tpope/vim-projectionist'
Plug 'mhinz/vim-rfc'

call plug#end()


" LSP
lua require'nvim-treesitter.configs'.setup { indent = { enable = true }, highlight = { enable = true }, incremental_selection = { enable = true }, textobjects = { enable = true }}


" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({}))<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>


" Colors / Background
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = '0'

set background=dark
colorscheme gruvbox

set updatetime=300
set shortmess+=c
set signcolumn=yes
" split
set splitbelow
set splitright

set mat=1
set cursorline
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

" Get a preview of replacements
set inccommand=split

" Use spelling for markdown files ‘]s’ to find next, ‘[s’ for previous, 'z=‘ for suggestions when on one.
" Source: http://thejakeharding.com/tutorial/2012/06/13/using-spell-check-in-vim.html
set spelllang=en
set spellsuggest=best
set wrap linebreak nolist
set formatoptions=l
set hidden

" Make the gutter for numbers wider by default
set numberwidth=5

set display+=lastline
set clipboard=unnamedplus
set mouse=
set ruler               " Show the line and column numbers of the cursor.
set autoread
set noshowmode                    " Show current mode.
set encoding=utf-8              " Set default encoding to UTF-8
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set autoindent
set tabstop=4 shiftwidth=4 expandtab
"set gdefault " use g flag by default on searches
set number relativenumber

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

set completeopt=menuone,noselect

