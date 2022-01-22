
" ===== Git ===== 
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
" Plug 'ThePrimeagen/git-worktree.nvim'
" Fugitive
nmap <leader>gs :G<CR>

" ===== Tests =====
Plug 'vim-test/vim-test'
" vim-test
nmap <silent> <leader>tt :TestNearest -strategy=neovim<CR>
nmap <silent> <leader>tf :TestFile -strategy=neovim<CR>
nmap <silent> <leader>tl :TestLast -strategy=neovim<CR>


