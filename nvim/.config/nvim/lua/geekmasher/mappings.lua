
local opts = { noremap=true, silent=true }

-- Increment/decrement
vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('n', '-', '<C-x>')

-- Centralise Jumping
vim.keymap.set('n', 'j', 'jzz', opts)
vim.keymap.set('n', 'k', 'kzz', opts)

vim.keymap.set('n', 'J', '20jzz', opts)
vim.keymap.set('n', 'K', '20kzz', opts)

-- LSP
vim.keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
vim.keymap.set('n', '<leader>gh', '<cmd>lua vim.lsp.buf.hover()<cr>')
vim.keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
vim.keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>')

vim.keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.document_symbol()<cr>')
vim.keymap.set('n', '<leader>gw', '<cmd>lua vim.lsp.buf.workspace_symbol()<cr>')

vim.keymap.set('n', '<leader>o', vim.diagnostic.open_float, opts)

-- Running Code
-- TODO: Redo this using Nvim plugin
vim.keymap.set('n', '<F5>', '<cmd>!geek-code --main<cr>')
vim.keymap.set('n', '<F10>', '<cmd>!geek-code --test<cr>')


-- Lazy man's saving...
vim.keymap.set('n', '<C-s>', '<cmd>:w<cr>')


-- Reselect the visual selections
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- JSON auto-format
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     group = vim.api.nvim_create_augroup("AutoFormatJSON", { clear  = true }),
--     pattern = "*.json",
--     callback = function()
--         -- Formats and sorts keys
--         vim.cmd("%!jq --sort-keys .")
--         -- print("Formatted JSON file...")
--     end
-- })
--

-- Rust
-- https://github.com/Saecki/crates.Nvim
local crates = require('crates')
local crate_opts = { noremap = true, silent = false }

vim.keymap.set('n', '<leader>cu', crates.upgrade_crate, crate_opts)
vim.keymap.set('v', '<leader>cu', crates.upgrade_crates, crate_opts)
vim.keymap.set('n', '<leader>cA', crates.upgrade_all_crates, crate_opts)


-- Telescope
local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')

vim.keymap.set(
    'n', '<leader>ff',
    function()
        -- Show hidden and ignored files
        telescope_builtin.find_files({ hidden = true, no_ignore = true })
    end
)
vim.keymap.set(
    'n', '<leader>fd',
    function()
        telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = vim.fn.expand('%:p:h'),
            respect_gitignore = false,
            hidden = false,
            grouped = true,
            previewer = false,
            initial_mode = "insert",
            layout_config = { height = 40 }
        })
    end
)

-- Trouble
vim.keymap.set("n", "<F11>", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
-- vim.keymap.set("n", "<leader>tf", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })



