local status, rust_tools = pcall(require, 'rust-tools')
if (not status) then return end

-- Rust
-- https://rust-analyzer.github.io/manual.html#nvim-lsp
-- https://sharksforarms.dev/posts/neovim-rust/
rust_tools.setup{
    tools = {
        autoSetHints = true,
        runnables = {
            use_telescope = true
        },
        inlay_hints = {
            only_current_line = true,
            show_parameter_hints = true,
            parameter_hints_prefix = "<= ",
            other_hints_prefix = "=> ",
        },
        hover_actions = {
            auto_focus = true
        },
    },
    server = {
        cmd = { "rustup", "run", "nightly", "rust-analyzer"},
        settings = {
            ["rust-analyzer"] = {
                assist = {
                    importEnforceGranularity = true,
                    importPrefix = "crate"
                },
                cargo = {
                    allFeatures = true
                },
                checkOnSave = {
                    -- cargo clippy --all-targets -- -D clippy::all
                    command = "clippy"
                },
            }
        }
    },
}


-- https://github.com/Saecki/crates.nvim
local status, crates = pcall(require, 'crates')
if status then
    crates.setup {
        autoupdate = false
    }
end

