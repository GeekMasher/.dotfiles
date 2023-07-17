return {
    -- https://github.com/folke/tokyonight.nvim
    -- https://github.com/gruvbox-community/gruvbox
    {
        "folke/tokyonight.nvim",
        config = function()
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
            vim.cmd("colorscheme tokyonight-storm")
        end
    },
    "flazz/vim-colorschemes",
    {
        "kyazdani42/nvim-web-devicons",
        dependencies = {
            "ryanoasis/vim-devicons"
        },
        config = function()
            require("nvim-web-devicons").setup {
                override = {},
                default = true,
            }
        end
    },
}
