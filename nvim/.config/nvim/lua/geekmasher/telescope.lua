
local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true}

local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = "🔍",
        hidden = true,
        color_devicons = true,

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        file_ignore_patterns = {
            "node_modules/",
            ".git/",
            ".vscode/",
            ".pyc",     -- Python
            "target/",  -- Rust
            "codeql/", "codeql-go/", "databases"     -- CodeQL
        },

        vimgrep_arguments = {
            'rg',
            '--hidden',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        }
    },
    pickers = {
        find_files = {
            hiddern = false 
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
    },
})

require("telescope").load_extension("fzy_native")


