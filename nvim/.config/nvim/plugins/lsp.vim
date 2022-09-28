
" LSP
Plug 'neovim/nvim-lspconfig'
" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/cmp-nvim-lsp'
" Snips
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

Plug 'glepnir/lspsaga.nvim'
Plug 'simrat39/symbols-outline.nvim'

" Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'onsails/lspkind-nvim'
 
Plug 'ldelossa/litee.nvim'
Plug 'ldelossa/litee-calltree.nvim'
 
" Rust
Plug 'simrat39/rust-tools.nvim'

" https://github.com/davidhalter/jedi-vim/blob/master/doc/jedi-vim.txt#L222
" let g:jedi#completions_command = "<C-b>"

set completeopt=menuone,noinsert,noselect
set shortmess+=c 
 
set updatetime=300
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })

" Code navigation shortcuts
nnoremap <leader> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <leader> gh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
"nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader> gr    <cmd>lua vim.lsp.buf.references()<CR>
"nnoremap <leader> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
"nnoremap <leader> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>






