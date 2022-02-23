" NeoVim
" - https://github.com/ThePrimeagen/.dotfiles/blob/master/nvim/.config/nvim/init.vim
" - https://gist.github.com/benfrain/4fe3aa3f54101d4565911998218ed724

if &compatible
    set nocompatible               " Be iMproved
endif

let mapleader = " "
set shell=zsh

" Required: 
filetype plugin indent on


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

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" TODO: https://github.com/jessarcher/dotfiles/blob/master/nvim/init.vim#L105-L110
" Plugins
call plug#begin('~/.vim/plugged')

" ===== Colour Scheme ===== 
source ~/.config/nvim/plugins/colours.vim
" ===== Misc =====
Plug 'ambv/black'
Plug 'mbbill/undotree'
Plug 'sbdchd/neoformat'
Plug 'vim-utils/vim-man'
Plug 'tpope/vim-projectionist'
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'

" ===== Git ===== 
source ~/.config/nvim/plugins/git.vim
" ===== LSP =====
source ~/.config/nvim/plugins/lsp.vim
" ===== Telescope =====
source ~/.config/nvim/plugins/telescope.vim
" ===== Treesitter =====
source ~/.config/nvim/plugins/treesitter.vim
" ===== Debugging =====
source ~/.config/nvim/plugins/debugging.vim

" ===== CodeQL =====
source ~/.config/nvim/plugins/codeql.vim 

" ===== Dev Misc =====
" Plug 'tpope/vim-commentary'
" Plug 'darrikonn/vim-gofmt'
Plug 'davidhalter/jedi-vim'
Plug 'voldikss/vim-floaterm'

" Plug 'mhinz/vim-rfc'


Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

call plug#end()

" Imports
lua require('geekmasher')

" Keys
source ~/.config/nvim/plugins/keybindings.vim

" Colors / Background
if !exists("g:syntax_on")
    syntax enable
endif 

set background=dark
set termguicolors
set pumblend=5

let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection = '0'

colorscheme gruvbox

set updatetime=300
set shortmess+=c
set signcolumn=yes
" split
set splitbelow
set splitright

set mat=1
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
set spell

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

