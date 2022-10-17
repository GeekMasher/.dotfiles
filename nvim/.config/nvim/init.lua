require('geekmasher.base')
require('geekmasher.plugins')
require('geekmasher.theme')
require('geekmasher.mappings')

-- If Linux
-- If MacOS
if vim.fn.has('macunix') then
    require('geekmasher.os-macos')
end

-- If Work



