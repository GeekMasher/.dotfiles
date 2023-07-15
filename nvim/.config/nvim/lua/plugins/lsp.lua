return {
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'j-hui/fidget.nvim',
        },
        config = function()
            local lsp = require('lsp-zero').preset({
                name = 'minimal',
                set_lsp_keymaps = true,
                manage_nvim_cmp = true,
                suggest_lsp_servers = false,
            })
            lsp.ensure_installed({
                'rust_analyzer',
                'pyright',
                'jsonls',
                'yamlls',
            })
            lsp.nvim_workspace()

            lsp.setup()
        end
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        config = function ()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    -- General
                    null_ls.builtins.diagnostics.typos,
                    null_ls.builtins.code_actions.gitsigns,
                    null_ls.builtins.diagnostics.actionlint,
                    null_ls.builtins.diagnostics.dotenv_linter,
                    null_ls.builtins.formatting.prettier.with({ filetypes = { "markdown" } }),
                    null_ls.builtins.diagnostics.markdownlint,
                    -- null_ls.builtins.completion.spell,
                    -- Lua
                    null_ls.builtins.formatting.stylua,
                    -- null_ls.builtins.diagnostics.luacheck,
                    -- Python
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.diagnostics.pydocstyle,
                    -- Rust
                    null_ls.builtins.formatting.rustfmt,

                    -- Security
                    -- null_ls.builtins.diagnostics.semgrep,
                },
            })
        end
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/nvim-compe",
            "L3MON4D3/LuaSnip",
            "hrsh7th/cmp-nvim-lsp",
            "onsails/lspkind-nvim",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-emoji",
        },
        config = function()
            local cmp = require("cmp")
            -- local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = {
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    -- Tab support
                    ['<Tab>'] = nil,
                    ['<S-Tab>'] = nil,
                    -- ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    -- ['<Tab>'] = cmp.mapping.select_next_item(),
                    -- docs
                    ["<C-j>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-k>"] = cmp.mapping.scroll_docs(4),
                    -- complete, close, confirm
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Insert,
                        select = true,
                    })
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" },
                    { name = "luasnip" },
                    -- { name = 'vsnip' },
                    { name = "buffer" },
                    { name = "path" },
                    { name = "emoji" },
                    -- Crates
                    { name = "crates" }
                },
            })
        end
    },
    "glepnir/lspsaga.nvim",
    "simrat39/symbols-outline.nvim",
}
