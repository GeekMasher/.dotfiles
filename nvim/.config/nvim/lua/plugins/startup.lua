-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/util.lua
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/ui/mini-starter.lua
return {
    -- measure startuptime
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        config = function()
            vim.g.startuptime_tries = 10
        end,
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = { options = vim.opt.sessionoptions:get() },
        -- stylua: ignore
        keys = {
            { "<leader>qs", function() require("persistence").load() end,                desc = "Restore Session" },
            { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
            {
                "<leader>qd",
                function() require("persistence").stop() end,
                desc =
                "Don't Save Current Session"
            },
        },
    },

    -- disable alpha
    { "goolord/alpha-nvim",     enabled = false },
    { "nvimdev/dashboard-nvim", enabled = false },
    {
        "echasnovski/mini.starter",
        event = "VimEnter",
        opts = function()
            local logo = table.concat({
                "      ___           ___           ___                                    ___      ",
                "     /__/\\         /  /\\         /  /\\          ___        ___          /__/\\     ",
                "     \\  \\:\\       /  /:/_       /  /::\\        /__/\\      /  /\\        |  |::\\    ",
                "      \\  \\:\\     /  /:/ /\\     /  /:/\\:\\       \\  \\:\\    /  /:/        |  |:|:\\   ",
                "  _____\\__\\:\\   /  /:/ /:/_   /  /:/  \\:\\       \\  \\:\\  /__/::\\      __|__|:|\\:\\  ",
                " /__/::::::::\\ /__/:/ /:/ /\\ /__/:/ \\__\\:\\  ___  \\__\\:\\ \\__\\/\\:\\__  /__/::::| \\:\\ ",
                " \\  \\:\\~~\\~~\\/ \\  \\:\\/:/ /:/ \\  \\:\\ /  /:/ /__/\\ |  |:|    \\  \\:\\/\\ \\  \\:\\~~\\__\\/ ",
                "  \\  \\:\\  ~~~   \\  \\::/ /:/   \\  \\:\\  /:/  \\  \\:\\|  |:|     \\__\\::/  \\  \\:\\       ",
                "   \\  \\:\\        \\  \\:\\/:/     \\  \\:\\/:/    \\  \\:\\__|:|     /__/:/    \\  \\:\\      ",
                "    \\  \\:\\        \\  \\::/       \\  \\::/      \\__\\::::/      \\__\\/      \\  \\:\\     ",
                "     \\__\\/         \\__\\/         \\__\\/           ~~~~                   \\__\\/  GeekMasher",
            }, "\n")
            local pad = string.rep(" ", 22)
            local new_section = function(name, action, section)
                return { name = name, action = action, section = pad .. section }
            end

            local starter = require("mini.starter")
            --stylua: ignore
            local config = {
                evaluate_single = true,
                header = logo,
                items = {
                    new_section("Find file", "Telescope find_files", "Telescope"),
                    new_section("Recent files", "Telescope oldfiles", "Telescope"),
                    new_section("Grep text", "Telescope live_grep", "Telescope"),
                    new_section("Lazy", "Lazy", "Config"),
                    new_section("Mason", "Mason", "Config"),
                    new_section("New file", "ene | startinsert", "Built-in"),
                    new_section("Quit", "qa", "Built-in"),
                    new_section("Session restore", [[lua require("persistence").load()]], "Session"),
                },
                content_hooks = {
                    starter.gen_hook.adding_bullet(pad .. "░ ", false),
                    starter.gen_hook.aligning("center", "center"),
                },
            }
            return config
        end,
        config = function(_, config)
            if vim.o.filetype == "lazy" then
                vim.cmd.close()
                vim.api.nvim_create_autocmd("User", {
                    pattern = "MiniStarterOpened",
                    callback = function()
                        require("lazy").show()
                    end,
                })
            end

            local starter = require("mini.starter")
            starter.setup(config)

            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyVimStarted",
                callback = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    local pad_footer = string.rep(" ", 8)
                    starter.config.footer = pad_footer ..
                        "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
                    pcall(starter.refresh)
                end,
            })
        end,
    },
}
