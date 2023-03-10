return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/playground"
        },
        config = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end
    }
}
