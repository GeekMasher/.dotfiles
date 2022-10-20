local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end

-- Null LS 
null_ls.setup({
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.completion.spell,
    },
})


