local status, trouble = pcall(require, "trouble")
if (not status) then return end


-- https://github.com/folke/trouble.nvim
trouble.setup {
    icons = true,
    height = 15,
    action_keys = {
        close = "q",
        toggle_mode = "m"
    }
}


