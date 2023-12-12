return {
    {
        "GeekMasher/DevSecInspect.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("devsecinspect").setup({
                tools = {
                    bandit = {},
                    npmaudit = {},
                    semgrep = {},
                    quibble = {},
                },
            })
        end
    }
}
