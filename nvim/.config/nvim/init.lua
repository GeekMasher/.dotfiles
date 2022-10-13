require('geekmasher.base')
require('geekmasher.theme')
require('geekmasher.mappings')
require('geekmasher.plugins')

require('geekmasher.staticfanatic')

-- If Linux
-- If MacOS
if vim.fn.has('macunix') then
    require('geekmasher.os-macos')
end

-- If Work



