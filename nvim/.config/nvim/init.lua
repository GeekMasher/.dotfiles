-- https://github.com/folke/lazy.nvim
-- Install Lazy if not present on the system
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require('lazy').setup('plugins')


-- Encoding
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
-- vim.opt.fileencoding = 'utf-8'

-- Relative Numbers
vim.opt.relativenumber = true
-- vim.wo.number = true
vim.opt.nu = true

-- Other
vim.opt.title = true
vim.opt.laststatus = 2
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.mouse = ""

-- Backup / Swap
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }

-- Shell used
vim.opt.shell = 'zsh'
vim.opt.cmdheight = 1
vim.opt.showcmd = false

-- Tab magic
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- No Wrap lines
vim.opt.wrap = false
vim.opt.backspace = { 'start', 'eol', 'indent' }

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Find files
vim.opt.path:append { '**' }
-- Ignore Files
vim.opt.wildignore:append {
    -- Git
    '**/.git/*',
    -- Python
    '**/.pyc',
    -- Rust
    '**/target/',
    -- JS/TS
    '*/node_modules/*',
    -- Mobile
    '**/ios/*',
    '**/android/*'
}

local opts = { noremap = true, silent = true }

-- Increment/decrement
vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('n', '-', '<C-x>')

-- Centralise Jumping
vim.keymap.set('n', 'j', 'jzz', opts)
vim.keymap.set('n', 'k', 'kzz', opts)

vim.keymap.set('n', 'J', '20jzz', opts)
vim.keymap.set('n', 'K', '20kzz', opts)

-- LSP
-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v1.x/doc/md/lsp.md#default-keybindings
vim.keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
vim.keymap.set('n', '<leader>k', '<cmd>lua vim.lsp.buf.hover()<cr>')
vim.keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
vim.keymap.set('n', '<C-K>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
vim.keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<cr>')

vim.keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.document_symbol()<cr>')
vim.keymap.set('n', '<leader>gw', '<cmd>lua vim.lsp.buf.workspace_symbol()<cr>')

vim.keymap.set('n', '<leader>o', vim.diagnostic.open_float, opts)
-- Expand Rust Macros
vim.keymap.set('n', '<leader>ge', '<cmd>lua require"rust-tools".expand_macro.expand_macro()<cr>')

-- Lazy man's saving...
vim.keymap.set('n', '<C-s>', '<cmd>:w<cr>')

-- Reselect the visual selections
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- On Save run formatter
local formatters = vim.api.nvim_create_augroup("formatters", { clear = true })
vim.api.nvim_create_autocmd({ "BufWritePre", "BufEnter" }, {
    group = formatters,
    callback = function()
        vim.lsp.buf.format()
    end
})

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
            respect_gitignore = true,
            hidden = true,
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
