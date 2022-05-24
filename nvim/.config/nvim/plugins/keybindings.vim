 
" General keys
nmap w <Up>
nmap a <Left>
nmap s <Down>
nmap d <Right>
nmap ff <cmd>delete<cr>

" https://github.com/davidhalter/jedi-vim/blob/master/doc/jedi-vim.txt#L222
let g:jedi#completions_command = "<C-b>"


" Easy to run code commands
nnoremap <leader>t <cmd>!geek-code --test<cr>
nnoremap <leader>m <cmd>!geek-code --main<cr>
" nvim-dap
nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>

" Laxy write like 'CTRL+s'
nnoremap <leader>s <cmd>:w<cr>

" Reselect the visual selection
vnoremap < <gv
vnoremap > >gv


