return {
    -- Rust
    -- https://github.com/simrat39/rust-tools.nvim
    -- https://rust-analyzer.github.io/manual.html#nvim-lsp
    -- https://sharksforarms.dev/posts/neovim-rust/
    {
        "simrat39/rust-tools.nvim",
        config = function()
            require("rust-tools").setup{
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
                    cmd = { "rustup", "run", "nightly", "rust-analyzer" },
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
                            }
                        }
                    }
                }
            }
        end
    },
    {
        "saecki/crates.nvim",
        config = function()
            require("crates").setup {
                smart_insert = true,
                autoupdate = false,
                text = {
                    loading = " Loading...",
                    version = " %s",
                    prerelease = " %s",
                    yanked = " %s",
                    nomatch = " No match",
                    upgrade = " %s",
                    error = " Error fetching crate",
                },
            }
        end
    }
}

