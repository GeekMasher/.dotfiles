
local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true}

local open = io.open

local actions = require("telescope.actions")

function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

function get_ignore_files()
    local files = {
        ".git/",
        ".vscode/",
        -- JS / Node
        "node_modules/",
        -- Python 
        ".pyc", ".venv/",
        -- Rust
        "target/", "Cargo.lock"
    }
    -- Read from file
    local file = ".vimignore"
    if not file_exists(file) then return files end
    for line in io.lines(file) do
        if line == nil or line == '' then
            line=""
        else
            files[#files + 1] = line
        end
    end
    return files
end

require("telescope").setup({
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = "🔍",
        hidden = true,
        color_devicons = true,

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        file_ignore_patterns = get_ignore_files(),

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


