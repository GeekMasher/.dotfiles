
local nvim_lsp = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local configs = require("lspconfig/configs")

-- Setup nvim-cmp.
local cmp = require("cmp")
local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}

cmp.setup({
	snippet = {
		expand = function(args)
			-- require("luasnip").lsp_expand(args.body)
            vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
 		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
        -- Tab support
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        -- docs
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
        -- complete, close, confirm
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        })
	},

    --formatting = {
    --    format = function(entry, vim_item)
    --        vim_item.kind = lspkind.presets.default[vim_item.kind]
    --        local menu = source_mapping[entry.source.name]
    --        if entry.source.name == 'cmp_tabnine' then
    --            if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
    --                menu = entry.completion_item.data.detail .. ' ' .. menu
    --            end
    --            vim_item.kind = ''
    --        end
    --        vim_item.menu = menu
    --        return vim_item
    --    end
    --},

	sources = {
        -- { name = "cmp_tabnine" },
        { name = "path" },
		{ name = "nvim_lsp" },
	    { name = 'vsnip' },
        --{ name = "luasnip" },
		{ name = "buffer" },
	},
})

--local tabnine = require('cmp_tabnine.config')
--tabnine:setup({
--    max_lines = 1000,
--    max_num_results = 20,
--    sort = true,
--    run_on_every_keystroke = true,
--  snippet_placeholder = '..',
--})

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}, _config or {})
end

-- Python
require("lspconfig").pyright.setup{}
require("lspconfig").jedi_language_server.setup(config())

-- TypeScript
require("lspconfig").tsserver.setup(config())

-- Rust
-- https://rust-analyzer.github.io/manual.html#nvim-lsp
-- https://sharksforarms.dev/posts/neovim-rust/
--require("lspconfig").rust_analyzer.setup(config({
--    cmd = { "rustup", "run", "nightly", "rust-analyzer"},
--    settings = {
--        ["rust-analyzer"] = {
--            checkOnSave = {
--                command = "clippy"
--            },
--        }
--    } 
--}))

local rust_opts = {
    tools = {
        autoSetHints = true,
        hover_with_actions = true,
        runnables = {
            use_telescope = true
        },
        inlay_hints = {
            -- only_current_line = true,
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },
    server = {
        cmd = { "rustup", "run", "nightly", "rust-analyzer"},
        settings = {
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}
require('rust-tools').setup(rust_opts)


local opts = {
	-- whether to highlight the currently hovered symbol
	-- disable if your cpu usage is higher than you want it
	-- or you just hate the highlight
	-- default: true
	highlight_hovered_item = true,

	-- whether to show outline guides
	-- default: true
	show_guides = true,
}

require("symbols-outline").setup(opts)

