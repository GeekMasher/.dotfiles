local status, telescope = pcall(require, "telescope")
if (not status) then return end 

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local sorters = require('telescope.sorters')
local previewers = require("telescope.previewers")

local open = io.open

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


-- https://github.com/nvim-telescope/telescope.nvim
telescope.setup {
    defaults = {
        file_sorter = sorters.get_fzy_sorter,
        
        prompt_prefix = "🔍 ",
        hidden = true,
        color_devicons = true,
        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,

        -- Customer ignore files func
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
        },
        mappings = {
            i = {
                ['<C-x>'] = false,
                ['<C-q>'] = actions.close
            }, 
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
        file_browser = {
            theme = "dropdown",
            hijack_netrw = true,
        }
    },
}

telescope.load_extension("file_browser")


