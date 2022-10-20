
vim.cmd("autocmd!")

-- Encoding
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Relative Numbers
vim.opt.relativenumber = true
-- vim.wo.number = true
vim.opt.nu = true

-- Leader
vim.g.mapleader = " "

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



