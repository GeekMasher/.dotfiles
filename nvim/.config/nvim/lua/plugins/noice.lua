-- https://github.com/folke/noice.nvim
-- https://github.com/pwntester/dotfiles/blob/d560edd670c159c872169e708443454cc44c366c/config/nvim/lua/pwntester/plugins/noice.lua

return {
    -- Noice
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify"
        },
        config = function()
            require("notify").setup({
                background_colour = "#000000"
            })
            require("noice").setup {
                popupmenu = { enabled = true },
                messages = { enabled = true },
                notify = { enabled = false },
                -- Popup vim cmd
                cmdline = {
                    enabled = true,
                    view = "cmdline_popup",
                    view_search = "cmdline_popup_search",
                    opts = { buf_options = { filetype = "vim" } },
                    icons = {
                        ["?"] = { icon = " ", hl_group = "NoiceCmdlineIconSearch" },
                        [":"] = { icon = " ", hl_group = "NoiceCmdlineIcon", firstc = false },
                    },
                },
                -- LSP Things
                lsp_progress = { enabled = false },
                lsp = {
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                presents = {
                    bottom_search = true,
                    command_palette = true,
                    lsp_doc_border = true,
                },
                -- Custom Views
                views = {
                    mini = {
                        position = {
                            row = -2
                        }
                    },
                    cmdline_popup = {
                        -- https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup
                        position = {
                            --row = "30%",
                            row = 15,
                            col = "50%",
                        },
                        size = {
                            width = 148,
                            height = "auto",
                        },
                    },
                    popupmenu = {
                        relative = "editor",
                        position = {
                            row = 18,
                            col = "50%",
                        },
                        size = {
                            width = 80,
                            height = 5,
                        },
                        border = {
                            style = "rounded",
                            padding = { 0, 1 },
                        },
                        win_options = {
                            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                        },
                    },
                }
            }
        end
    }
}
