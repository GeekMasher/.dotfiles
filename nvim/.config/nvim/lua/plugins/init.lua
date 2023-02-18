return {
    -- Status Line
    "nvim-lualine/lualine.nvim",
    -- Git
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup {}
        end
    },
    "folke/neodev.nvim",
    -- Trouble
    {
        -- https://github.com/folke/trouble.nvim
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = true,
                height = 15,
                action_keys = {
                    close = "q",
                    toggle_mode = "m"
                }
            }
        end
    },
    -- Comment
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup {
                -- <C-_> == <CTRL> /
                toggler = { line = '<C-_>' },
                opleader = { line = '<C-_>' }
            }
        end
    },
}
