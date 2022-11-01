local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

-- https://github.com/neovim/nvim-lspconfig

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
	sources = {
        { name = "path" },
		{ name = "nvim_lsp" },
	    { name = 'vsnip' },
		{ name = "buffer" },
        -- Crates
        { name = "crates" }
	},
})



local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}, _config or {})
end

-- Python
nvim_lsp.pyright.setup(config())
--require("lspconfig").jedi_language_server.setup(config())

-- TypeScript
nvim_lsp.tsserver.setup(config())


-- JSON 
nvim_lsp.jsonls.setup(config())

-- Yaml
nvim_lsp.yamlls.setup{
    on_attach=on_attach,
    flags = lsp_flags,
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    settings = {
        yaml = {
            schemas = {
                -- GitHub Actions
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                -- Docker Compose
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.yml"
            }
        }
    }
}


local status, symbols_outline = pcall(require, 'symbols-outline')
if status then
    -- Outline
    symbols_outline.setup{
        -- whether to highlight the currently hovered symbol
        -- disable if your cpu usage is higher than you want it
        -- or you just hate the highlight
        -- default: true
        highlight_hovered_item = true,
        -- whether to show outline guides
        -- default: true
        show_guides = true,
    }
end
