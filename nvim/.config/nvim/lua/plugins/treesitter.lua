return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = "VeryLazy",
        dependencies = {
            "nvim-treesitter/playground"
        },
        config = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end
    }
}
