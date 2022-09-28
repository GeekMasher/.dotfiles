local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
    autotag = {
        enable = true,
    },
    autoparis = {
        enable = true
    },
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    ensure_installed = {
        -- Rust
        "rust",
        -- Python
        "python",
        -- JS/TS
        "javascript",
        "typescript",
        "tsx",
        -- For nvim
        "lua",

        -- Random langs
        "html",
        "css",
        "json",
        "graphql",
    },
}




