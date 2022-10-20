require('geekmasher.base')
require('geekmasher.plugins')
require('geekmasher.theme')
require('geekmasher.mappings')


-- If MacOS
if vim.fn.has('macunix') then
    require('geekmasher.os-macos')
end

-- If Work or Personal
if vim.env.GEEK_MACHINE == "work" then
    local statuc, work = pcall(require, 'geekmasher.work')
else 
    local status, personal = pcall(require, 'geekmasher.personal')
end



