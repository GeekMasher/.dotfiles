local status, comment = pcall(require, "Comment")
if (not status) then return end

comment.setup {
    -- <C-_> == <CTRL> /
    toggler = { line = '<C-_>' },
    opleader = { line = '<C-_>' }
}


