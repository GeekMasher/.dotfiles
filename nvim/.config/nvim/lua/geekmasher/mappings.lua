

-- Increment/decrement
vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('n', '-', '<C-x>')



-- LSP
vim.keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
vim.keymap.set('n', '<leader>gh', '<cmd>lua vim.lsp.buf.hover()<cr>')
vim.keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
vim.keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>')

vim.keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.document_symbol()<cr>')
vim.keymap.set('n', '<leader>gw', '<cmd>lua vim.lsp.buf.workspace_symbol()<cr>')


-- Running Code
-- TODO: Redo this using Nvim plugin
vim.keymap.set('n', '<F5>', '<cmd>!geek-code --main<cr>')
vim.keymap.set('n', '<F10>', '<cmd>!geek-code --test<cr>')


-- Lazy man's saving...
vim.keymap.set('n', '<C-s>', '<cmd>:w<cr>')

-- Reselect the visual selections
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')









