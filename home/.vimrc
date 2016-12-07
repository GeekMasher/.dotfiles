
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')

" Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'tpope/vim-fugitive'
"Plugin 'kien/ctrlp.vim'
"Plugin 'scrooloose/syntastic'
"Plugin 'Yggdroot/indentLine'
"Plugin 'marijnh/tern_for_vim'
"Plugin 'bling/vim-airline'
"Plugin 'othree/html5.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'pangloss/vim-javascript'
Plugin 'Valloric/YouCompleteMe'


" Vundle end
call vundle#end()
filetype on

syntax enable
colorscheme desert

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup        " don't create a backup file, use versions instead
set nowritebackup   " don't create backup files while editing
set noswapfile      " don't keep a swap file
set ruler           " always show cursor position
set nu              " show line numbers
set history=50      " keep 50 lines of command history
set showcmd         " display incomplete commands
set incsearch       " do incremental searching
set expandtab       " insert spaces instead of tab literals
set shiftwidth=4    " custom width for shift
set tabstop=4       " custom width for tab

" highlight any lines that go over specified character limit
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" custom location for undo directory
set undodir=$HOME/.vim/undo

" enable syntax and search highlighting if the terminal has colours
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


