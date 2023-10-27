return {
    "pwntester/codeql.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        {
            's1n7ax/nvim-window-picker',
            config = function()
                require 'window-picker'.setup({
                    autoselect_one = true,
                    include_current = false,
                    filter_rules = {
                        bo = {
                            filetype = {
                                "codeql_panel",
                                "codeql_explorer",
                                "qf",
                                "TelescopePrompt",
                                "TelescopeResults",
                                "notify",
                                "NvimTree",
                                "neo-tree",
                            },
                            buftype = { 'terminal' },
                        },
                    },
                    current_win_hl_color = '#e35e4f',
                    other_win_hl_color = '#44cc41',
                })
            end,
        }
    },
    config = function()
        require("codeql").setup {
            results = {
                max_paths = 10,
                max_path_depth = nil,
            },
            panel = {
                width = 100,
                pos = "botright",
                group_by = "sink", -- "source"
                show_filename = true,
                long_filename = false,
                context_lines = 3,
            },
            max_ram = 32000,
            job_timeout = 15000,
            format_on_save = true,
            additional_packs = {
                "./codeql",
            },
            mappings = {
                run_query = { modes = { "n" }, lhs = "<leader>qr", desc = "run query" },
                quick_eval = { modes = { "x", "n" }, lhs = "<leader>qe", desc = "quick evaluate" },
                quick_eval_predicate = { modes = { "n" }, lhs = "<leader>qp", desc = "quick evaluate enclosing predicate" },
            },
        }
    end
}
