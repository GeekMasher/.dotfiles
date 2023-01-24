
-- Colouring
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'

-- Settings
-- https://github.com/folke/tokyonight.nvim
require("tokyonight").setup({
    style = "storm",
    transparent = true,
    terminal_colors = true,
    styles = {
        comments = { italic = true },
        keywords = { italic = true },
    },
    sidebars = { "qf", "vista_kind", "terminal", "packer" },
})

-- Set scheme
vim.cmd("colorscheme tokyonight-storm")
-- vim.cmd("colorscheme gruvbox")

