local status, packer = pcall(require, 'packer')
if (not status) then
    vim.notify("Packer is not installed...")
    return
end

-- Packer
vim.cmd [[packadd packer.nvim ]]
packer.startup(function(use)

    -- Keeps Packer updating Packer
    use 'wbthomason/packer.nvim'
     
    -- Utils
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'

    -- Themes
    use 'gruvbox-community/gruvbox'
    use 'flazz/vim-colorschemes'
    use 'folke/tokyonight.nvim'
    use 'kyazdani42/nvim-web-devicons'

    -- Telescope
    use 'nvim-telescope/telescope.nvim'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use 'nvim-treesitter/playground'


    -- LSP Magic
    use "neovim/nvim-lspconfig"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/nvim-compe"
    use "hrsh7th/cmp-nvim-lsp"
    use "onsails/lspkind-nvim"

    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-buffer"

    -- Snippets
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/vim-vsnip"

    -- LSP saga
    use "glepnir/lspsaga.nvim"
    use "simrat39/symbols-outline.nvim"


    -- Language Plugins
    use "simrat39/rust-tools.nvim"
end)

