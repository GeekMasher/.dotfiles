-- https://github.com/github/copilot.vim
-- https://github.com/zbirenbaum/copilot.lua

return {
    "zbirenbaum/copilot.lua",
    event = "VeryLazy",
    dependencies = {
        "zbirenbaum/copilot-cmp"
    },
    config = function()
        require("copilot").setup({
            suggestion = {
                enabled = true,
                auto_trigger = true,
            },
            panel = {
                enabled = false
            },
        })

        require("copilot_cmp").setup()
    end,
}
